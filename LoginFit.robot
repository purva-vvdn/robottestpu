from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
import time

# Fit login URL
Fit_url = "http://172.24.131.223/code-editor"

# Headless mode setup
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run browser in headless mode
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--window-size=1920,1080")

# Initialize the Chrome driver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

try:
    # Open the Amazon login page
    driver.get(amazon_url)
    
    # Wait for the page to load
    time.sleep(3)
    
    # Enter the email or phone number
    email_input = driver.find_element(By.ID, "ap_email")
    email_input.send_keys("your_email@example.com")  # Replace with your email or phone number
    
    # Click on continue
    continue_button = driver.find_element(By.ID, "continue")
    continue_button.click()
    
    # Wait for the password field to appear
    time.sleep(2)
    
    # Enter the password
    password_input = driver.find_element(By.ID, "ap_password")
    password_input.send_keys("your_password")  # Replace with your password
    
    # Click on the sign-in button
    sign_in_button = driver.find_element(By.ID, "signInSubmit")
    sign_in_button.click()
    
    # Wait for the login to complete
    time.sleep(5)
    
    # Optionally, check if the login was successful by looking for an element
    print("Login successful!" if "your account" in driver.page_source.lower() else "Login failed.")
    
finally:
    # Close the browser
    driver.quit()
