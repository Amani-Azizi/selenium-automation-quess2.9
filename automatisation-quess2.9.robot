*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://quess360.bcepharma.com/
${USER}   admin.itdev
${PASS}   Bce!!2025
@{Options}    ATP ONCO    ATP SCAS    Sans Role
*** Test Cases ***
Mon test de connexion
    Open Browser    ${URL}    chrome
    Maximize Browser Window 
    Input Text     id=username    ${USER}
    Input Text     id=password    ${PASS}
    Click Button   xpath=//*[@id="main"]/div/form/div[3]/button
    Wait Until Element Is Visible    xpath=//*[@id="main"]/div/ul/li[1]/div    6s
    #Sélectionner Plusieurs Options Dans Dropdown
    Click Element    xpath=//*[@id="sessionModifier"]/table/tbody/tr[3]/td[2]/div/button 

    # Pour chaque option dans la liste, clique sur la checkbox correspondante
    FOR    ${option}    IN    @{Options}
        # XPath qui cherche le label contenant le texte ${option}, puis coche la checkbox
        Click Element    xpath=//ul[contains(@class,'multiselect-container')]//label[contains(., "${option}")]/input
    END
    Sleep    2s
    # Cliquer ailleurs pour fermer dropdown (exemple : header)
    Click Element    xpath=//*[@id="header"]
    Sleep    3s
   # Vérification finale (exemple: attendre un élément visible après fermeture)
    Wait Until Element Is Visible    xpath=//*[@id="main"]/div/ul/li[1]/div
    Sleep    3s
    Close Browser


