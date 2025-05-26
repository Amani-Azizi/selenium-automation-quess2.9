from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

def login(driver, username, password):
    driver.get("https://quess360.bcepharma.com/")  # Remplace par l'URL réelle

    # Trouver les champs login / password (adapté selon ton site)
    driver.find_element(By.ID, "username").send_keys(username)
    driver.find_element(By.ID, "password").send_keys(password)
    driver.find_element(By.CLASS_NAME, "btn btn-primary btn-small pull-right").click()



    time.sleep(3)  # Attendre que la page se charge, améliore ensuite avec WebDriverWait
