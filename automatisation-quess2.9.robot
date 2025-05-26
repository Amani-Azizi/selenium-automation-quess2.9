*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    builtIn 
Library    String
Library    OperatingSystem

*** Keywords ***
Remplir Les Champs Avec Nombres Aléatoires
    [Arguments]    @{xpaths}
    FOR    ${xpath}    IN    @{xpaths}
        ${nombre}=    Evaluate    __import__('random').randint(-25, 10)
        Input Text    xpath=${xpath}    ${nombre}
    END
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

    Click Element    xpath=//*[@id="main"]/div/ul/li[1]/div
    Wait Until Element Is Visible    xpath=//*[@id="header-logo"]
    Sleep    2s
    Click Element    xpath=//*[@id="main"]/div/ul/li[58]/div/span[2]
    Wait Until Element Is Visible    XPath=//*[@id="main"]/form/div[1]/div[2]/h3
    Sleep    2s
     ${champs}=    Create List
    ...    //*[@id="main"]/form/div[1]/div[2]/div[2]/div/div[4]/div/input[1]
    ...    //*[@id="main"]/form/div[1]/div[2]/div[3]/div/div[4]/div/input[1]
    ...    //*[@id="main"]/form/div[1]/div[3]/div[2]/div/div[4]/div/input[1]
    ...    //*[@id="main"]/form/div[1]/div[3]/div[3]/div/div[4]/div/input[1]
    ...    //*[@id="main"]/form/div[1]/div[3]/div[4]/div/div[4]/div/input[1]
    ...    

    Sleep    2s




    Close Browser


