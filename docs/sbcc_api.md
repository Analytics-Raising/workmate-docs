# SBCC Message Feedback API

API for submitting and managing SBCC (Social and Behavior Change Communication) message feedback. Supports both **production** requests (data is stored) and **test** requests (data is not stored; same response, no persistence).

## Authentication

All SBCC endpoints require authentication. Use one of:

- **JWT**: `Authorization: Bearer <access_token>`
- **API key** with `sbcc` scope: `X-API-Key: <your_api_key>` or `Authorization: ApiKey <your_api_key>`

## Production vs test requests

| | Production | Test |
|---|------------|------|
| **Purpose** | Real submissions; data is stored in the database. | Verify API behavior without persisting data (e.g. Postman, scripts). |
| **Request** | No special header. | Send header: `X-Test-Mode: true` (or `X-Test-Mode: 1`). |
| **Persistence** | Data is saved (POST/PUT/PATCH) or deleted (DELETE). | No data is saved or deleted; the transaction is rolled back after the response. |
| **Response** | Normal status and body. | Same status and body as production; response includes header `X-Test-Mode: true` so the client can confirm no data was persisted. |

### Making a production request

Do **not** send `X-Test-Mode`. Data will be stored as usual.

=== "cURL"
    ``` bash
    curl -X POST "https://your-api/sbcc/message-feedback/" \
      -H "Authorization: Bearer <token>" \
      -H "Content-Type: application/json" \
      -d '{"form_guid":"f1","user_guid":"u1","practice":"Pit Composting","barrier":"Lack of Resources","is_liked":false,"generated_message":"The beneficiary should ...","preferred_message":"The beneficiary is advised to ..."}'
    ```

=== "Python"
    ``` python
    import requests

    url = "https://your-api/sbcc/message-feedback/"
    headers = {
        "Authorization": "Bearer <token>",
        "Content-Type": "application/json",
    }
    payload = {
        "form_guid": "f1",
        "user_guid": "u1",
        "practice": "Pit Composting",
        "barrier": "Lack of Resources",
        "is_liked": False,
        "generated_message": "The beneficiary should ...",
        "preferred_message": "The beneficiary is advised to ...",
    }
    response = requests.post(url, headers=headers, json=payload)
    response.raise_for_status()
    data = response.json()
    ```

=== "JavaScript"
    ``` javascript
    const url = "https://your-api/sbcc/message-feedback/";
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Authorization": "Bearer <token>",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        form_guid: "f1",
        user_guid: "u1",
        practice: "Pit Composting",
        barrier: "Lack of Resources",
        is_liked: false,
        generated_message: "The beneficiary should ...",
        preferred_message: "The beneficiary is advised to ...",
      }),
    });
    const data = await response.json();
    ```

### Making a test request

Send the header `X-Test-Mode: true`. The API will process the request and return the same response as production, but **no data will be written or deleted**.

=== "cURL"
    ``` bash
    curl -X POST "https://your-api/sbcc/message-feedback/" \
      -H "Authorization: Bearer <token>" \
      -H "Content-Type: application/json" \
      -H "X-Test-Mode: true" \
      -d '{"form_guid":"f1","user_guid":"u1","practice":"Pit Composting","barrier":"Lack of Resources","is_liked":false,"generated_message":"The beneficiary should ...","preferred_message":"The beneficiary is advised to ..."}'
    ```

=== "Python"
    ``` python
    import requests

    url = "https://your-api/sbcc/message-feedback/"
    headers = {
        "Authorization": "Bearer <token>",
        "Content-Type": "application/json",
        "X-Test-Mode": "true",
    }
    payload = {
        "form_guid": "f1",
        "user_guid": "u1",
        "practice": "Pit Composting",
        "barrier": "Lack of Resources",
        "is_liked": False,
        "generated_message": "The beneficiary should ...",
        "preferred_message": "The beneficiary is advised to ...",
    }
    response = requests.post(url, headers=headers, json=payload)
    response.raise_for_status()
    data = response.json()
    ```

=== "JavaScript"
    ``` javascript
    const url = "https://your-api/sbcc/message-feedback/";
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Authorization": "Bearer <token>",
        "Content-Type": "application/json",
        "X-Test-Mode": "true",
      },
      body: JSON.stringify({
        form_guid: "f1",
        user_guid: "u1",
        practice: "Pit Composting",
        barrier: "Lack of Resources",
        is_liked: false,
        generated_message: "The beneficiary should ...",
        preferred_message: "The beneficiary is advised to ...",
      }),
    });
    const data = await response.json();
    ```

Check the response headers for `X-Test-Mode: true` to confirm the request was handled in test mode.

**Which methods support test mode?**

- **POST** (create): Response 201 + body as if created; no row is stored.
- **PUT** / **PATCH** (update): Response 200 + updated body; no changes are stored.
- **DELETE**: Response 204; the row is not deleted.
- **GET**: Read-only; no writes. Test header has no effect (no data to roll back).

---

## Base path

All SBCC endpoints are under:

```
/sbcc/
```

---

## Endpoints

### List and create feedback

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sbcc/message-feedback/` | List all feedbacks (optional filters below). |
| POST | `/sbcc/message-feedback/` | Create a new feedback. |

**GET query parameters (optional):**

- `form_guid` – Filter by form GUID.
- `user_guid` – Filter by user GUID.
- `practice` – Filter by practice (substring).
- `barrier` – Filter by barrier (substring).
- `is_liked` – Filter by like: `true` or `false`.

**POST body (JSON):**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `form_guid` | string | Yes | Form identifier. |
| `user_guid` | string | Yes | User identifier. |
| `practice` | string | Yes | Practice name (e.g. "Pit Composting"). |
| `barrier` | string | Yes | Barrier (e.g. "Lack of Resources"). |
| `is_liked` | boolean | Yes | Whether the message was liked. |
| `generated_message` | string | Yes | The generated message text. |
| `preferred_message` | string | No | User's preferred message (default empty). |

**Example POST body:**

```json
{
  "form_guid": "form-001",
  "user_guid": "user-123",
  "practice": "Pit Composting",
  "barrier": "Lack of Resources",
  "is_liked": false,
  "generated_message": "The beneficiary should ...",
  "preferred_message": "The beneficiary is advised to ..."
}
```

---

### Single feedback (retrieve, update, delete)

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sbcc/message-feedback/<id>/` | Get one feedback by primary key. |
| PUT | `/sbcc/message-feedback/<id>/` | Full update. |
| PATCH | `/sbcc/message-feedback/<id>/` | Partial update. |
| DELETE | `/sbcc/message-feedback/<id>/` | Delete the feedback. |

For **PUT**, **PATCH**, and **DELETE**, send `X-Test-Mode: true` to run in test mode (no persistence).

---

## Response format

- **GET list**: `200 OK` – JSON array of feedback objects.
- **GET one**: `200 OK` – JSON feedback object.
- **POST**: `201 Created` – JSON feedback object (includes `id`, `created_at`, `updated_at`).
- **PUT / PATCH**: `200 OK` – JSON feedback object.
- **DELETE**: `204 No Content` – empty body.
- **Validation error**: `400 Bad Request` – JSON object with field errors.
- **Not found**: `404 Not Found` – JSON `{"error": "SBCC message feedback not found"}`.

Each feedback object includes: `id`, `form_guid`, `user_guid`, `practice`, `barrier`, `is_liked`, `generated_message`, `preferred_message`, `created_at`, `updated_at`.

---

## Python example

Use your Workmate API key to get and submit SBCC message feedback. Replace `API_KEY` and `BASE_URL` with your values. Install: `pip install requests`.

### Quick usage

```python
import requests

API_KEY = "wm_your_api_key_here"  # From Workmate: Superuser > API Keys
BASE_URL = "http://localhost:8000"  # Or your Workmate API URL
URL = f"{BASE_URL}/sbcc/message-feedback/"

headers = {"Content-Type": "application/json", "X-API-Key": API_KEY}

# List feedbacks
r = requests.get(URL, headers=headers)
r.raise_for_status()
feedbacks = r.json()

# Create feedback
payload = {
    "form_guid": "form-abc-123",
    "user_guid": "user-xyz-456",
    "practice": "Handwashing",
    "barrier": "Lack of soap",
    "generated_message": "Wash hands with soap before eating.",
    "is_liked": True,
    "preferred_message": "",
}
r = requests.post(URL, headers=headers, json=payload)
r.raise_for_status()
created = r.json()
```

### Full example script

```python
"""
SBCC Message Feedback API with API Key authentication.
Replace API_KEY and BASE_URL with your values. Install: pip install requests
"""
import requests

API_KEY = "wm_your_api_key_here"
BASE_URL = "http://localhost:8000"
SBCC_MESSAGE_FEEDBACK_URL = f"{BASE_URL}/sbcc/message-feedback/"


def get_headers():
    return {"Content-Type": "application/json", "X-API-Key": API_KEY}


def list_feedbacks(form_guid=None, user_guid=None, practice=None, barrier=None, is_liked=None):
    """GET /sbcc/message-feedback/ with optional filters."""
    params = {}
    if form_guid is not None:
        params["form_guid"] = form_guid
    if user_guid is not None:
        params["user_guid"] = user_guid
    if practice is not None:
        params["practice"] = practice
    if barrier is not None:
        params["barrier"] = barrier
    if is_liked is not None:
        params["is_liked"] = str(is_liked).lower()
    response = requests.get(SBCC_MESSAGE_FEEDBACK_URL, headers=get_headers(), params=params)
    response.raise_for_status()
    return response.json()


def create_feedback(
    form_guid: str,
    user_guid: str,
    practice: str,
    barrier: str,
    generated_message: str,
    is_liked: bool = False,
    preferred_message: str = "",
):
    """POST /sbcc/message-feedback/"""
    payload = {
        "form_guid": form_guid,
        "user_guid": user_guid,
        "practice": practice,
        "barrier": barrier,
        "generated_message": generated_message,
        "is_liked": is_liked,
        "preferred_message": preferred_message or "",
    }
    response = requests.post(SBCC_MESSAGE_FEEDBACK_URL, headers=get_headers(), json=payload)
    response.raise_for_status()
    return response.json()


def get_feedback(feedback_id: int):
    """GET /sbcc/message-feedback/<id>/"""
    url = f"{SBCC_MESSAGE_FEEDBACK_URL}{feedback_id}/"
    response = requests.get(url, headers=get_headers())
    response.raise_for_status()
    return response.json()


def update_feedback(feedback_id: int, data: dict, partial: bool = True):
    """PATCH or PUT /sbcc/message-feedback/<id>/"""
    url = f"{SBCC_MESSAGE_FEEDBACK_URL}{feedback_id}/"
    method = requests.patch if partial else requests.put
    response = method(url, headers=get_headers(), json=data)
    response.raise_for_status()
    return response.json()


def delete_feedback(feedback_id: int):
    """DELETE /sbcc/message-feedback/<id>/"""
    url = f"{SBCC_MESSAGE_FEEDBACK_URL}{feedback_id}/"
    response = requests.delete(url, headers=get_headers())
    response.raise_for_status()
    return response.status_code == 204


if __name__ == "__main__":
    if "your_api_key_here" in API_KEY:
        print("Replace API_KEY with your Workmate API key, then run again.")
        exit(0)
    feedbacks = list_feedbacks()
    print(f"Found {len(feedbacks)} feedback(s)")
    new_feedback = create_feedback(
        form_guid="form-abc-123",
        user_guid="user-xyz-456",
        practice="Handwashing",
        barrier="Lack of soap",
        generated_message="Wash hands with soap before eating.",
        is_liked=True,
        preferred_message="",
    )
    print("Created:", new_feedback["id"])
```

To run in **test mode** (no data saved), add the header to each request:

```python
headers = {"Content-Type": "application/json", "X-API-Key": API_KEY, "X-Test-Mode": "true"}
```
