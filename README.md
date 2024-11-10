## System requirements

To get started, make sure you have the following tools installed:

| Tool               | Download Link                                                  |
|--------------------|----------------------------------------------------------------|
| **Flutter SDK**         | [Download Flutte SDK](https://docs.flutter.dev/get-started/install)  |


---

## Already have Flutter installed?

If you already have Flutter installed run the following command to updated:
```
flutter upgrade
```

To check that flutter is installed and setuped properly rune the following:
```
flutter doctor
```

---


## Project setup process

### Step 1: Create a Personal Access Token (PAT) on GitHub

> If you already possess a vlaid GitHub PAT you can skip this part

To authenticate with GitHub, you'll need a Personal Access Token (PAT). Follow these steps to create one:

1) Go to **GitHub** and log in to your account.
2) Navigate to **Profile Settings**:
   - Click on your profile icon in the top-right corner.
   -  Select **Settings** from the dropdown menu.
3) In the left sidebar, scroll down and select **Developer Settings**.
4) Under **Developer Settings**, click on **Personal Access Tokens**.
5) Click **Tokens (classic)** to access the section for generating new tokens. 
6) Select **Generate New Token** and follow the prompts to configure and create your PAT.

> Note: Remember to copy the generated PAT and save it for later use

### Step 2: Clone the Repository

Clone the project repository to your local machine:

Clone repository
```
git clone https://github.com/RUPS-FERI/frontend.git
cd frontend
```

---

### Step 3: Set Up Environment Variables

1) Copy & paste `.env.example` and rename it to `.env`

    ```
    cp .env.example .env
    ```
   
2) Open the `.env` file and replace placeholders marked as `ChangeThis` with your actual configuration values.

--- 

### Step 4: Get the required flutter packages

Before you can run the app you must run the following to intall the dependenies
```
flutter pub get
```

### Step 5: Run the app

Option 1) If you are using an IDE like Andoroid studio or code editor like Visual Studio Code you can download Flutter plugin and run the app by simply pressing the run button.

Option 2) If you wish to run the by using the terminal you must use the following command and select the device you want you app to run on:
```
flutter run
```
