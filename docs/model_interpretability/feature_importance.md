# [Explore Feature Importance in Workmate](https://app.tango.us/app/workflow/360336d2-b040-4898-b0e9-b11db5151ba6?utm_source=markdown&utm_medium=markdown&utm_campaign=workflow%20export%20links)

This page allows analyze what features are most important for predictions and how they contribute to the prediction.

__Creation Date:__ Aug 26, 2025  
__Created By:__ Juma Shafara Kibekityo  



***




### 1. How to access

The feature importance chart can be accessed under the "Model Interpretability" section on the side bar.

![Step 1 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/3b26374b-ca02-4dcb-9557-155fdef08b60/19b43b21-d845-4200-bbb3-5ca52f6a4fa9.png?crop=focalpoint&fit=crop&fp-x=0.0881&fp-y=0.2348&fp-z=2.1245&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=7&mark-y=352&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz00MzUmaD03MCZmaXQ9Y3JvcCZjb3JuZXItcmFkaXVzPTEw)


### 2. Click on Feature Importance
![Step 2 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/1aa9b49f-dc24-4333-b721-2442b6b541af/de26cd47-c96c-4c14-8b99-1c0fe1af16e5.png?crop=focalpoint&fit=crop&fp-x=0.0885&fp-y=0.3031&fp-z=2.2892&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=55&mark-y=354&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz0zNzYmaD02OCZmaXQ9Y3JvcCZjb3JuZXItcmFkaXVzPTEw)


### 3. Variable Descriptions

This section as the title, describes the variable names used, what they mean and their data type. You can always refer to this incase you find a feature you don't relate to.

![Step 3 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/b440b7cb-8ff7-4522-84fe-29c923bb165d/c6ec1a1c-b93a-48f2-886f-be112c125991.png?crop=focalpoint&fit=crop&fp-x=0.5819&fp-y=0.5827&fp-z=1.2357&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=20&mark-y=112&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz0xMTYwJmg9NTUzJmZpdD1jcm9wJmNvcm5lci1yYWRpdXM9MTA%3D)


### 4. Feature Importance

This chart shows which are the most important features used for the model to predict household status as per target. The longest bar shows the most important feature and the shortest bar shows the vice versa.

![Step 4 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/1fef875f-31a7-4acd-833d-176484dff770/7331fe29-12a6-4a93-9aa3-39b6dc962c26.png?crop=focalpoint&fit=crop&fp-x=0.5819&fp-y=0.4525&fp-z=1.2627&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=34&mark-y=175&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz0xMTMzJmg9NDI3JmZpdD1jcm9wJmNvcm5lci1yYWRpdXM9MTA%3D)


### 5. Partial Dependence Plot

A **Partial Dependence Plot (PDP)** shows how changing one **feature** (like land size) affects the model’s predictions **on average across all data**.  
For example this shows on average, as land size increase from 0 to 5, the chances of hitting the target also increase.

![Step 5 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/82c85beb-6781-49fc-9d33-d67d7c713e05/68d4b32c-e8fa-4e7f-8854-3cb4d8ed707d.png?crop=focalpoint&fit=crop&fp-x=0.3836&fp-y=0.7172&fp-z=1.5359&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=276&mark-y=180&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz02NDcmaD01MjAmZml0PWNyb3AmY29ybmVyLXJhZGl1cz0xMA%3D%3D)


### 6. Two-way Partial Dependece Plot

A **Two-Way Partial Dependence Plot** shows how the **combined effect of two features** influences a model’s predictions.

Instead of varying just one feature (like farm implements owned), you vary **two features together** (e.g., farm impolements owned **and** total household memebers) and see how predictions change across their combinations.

![Step 6 screenshot](https://images.tango.us/workflows/360336d2-b040-4898-b0e9-b11db5151ba6/steps/392d0dca-0db4-43cb-902f-127da44d9415/a21d3d51-a3a0-423e-ae23-d1d59e58852a.png?crop=focalpoint&fit=crop&fp-x=0.7802&fp-y=0.7172&fp-z=1.9979&w=1200&border=2%2CF4F2F7&border-radius=8%2C8%2C8%2C8&border-radius-inner=8%2C8%2C8%2C8&blend-align=bottom&blend-mode=normal&blend-x=0&blend-w=1200&blend64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL21hZGUtd2l0aC10YW5nby13YXRlcm1hcmstdjIucG5n&mark-x=252&mark-y=51&m64=aHR0cHM6Ly9pbWFnZXMudGFuZ28udXMvc3RhdGljL2JsYW5rLnBuZz9tYXNrPWNvcm5lcnMmYm9yZGVyPTQlMkNGRjc0NDImdz04NDImaD02NzYmZml0PWNyb3AmY29ybmVyLXJhZGl1cz0xMA%3D%3D)


### 7. Contact us 

Should you need any assistance, don't hesitate to contact us at workmate@raisingthevillage.org


<br/>

***
Created with [Tango.ai](https://tango.ai?utm_source=markdown&utm_medium=markdown&utm_campaign=workflow%20export%20links)