from selenium import webdriver
from utils.helpers import login

def main():
    driver = webdriver.Chrome()  # Assure-toi que chromedriver est dans PATH ou dans drivers/
    try:
        login(driver, "ton_utilisateur", "ton_motdepasse")
        # Ici tu peux ajouter d'autres étapes de ton scénario
    finally:
        driver.quit()

if __name__ == "__main__":
    main()

