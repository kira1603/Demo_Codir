*** Settings ***
Documentation  Ajout regroupement avec Robot Framework
...
Library  SeleniumLibrary  

*** Variables ***
${Gestion_Article_url}    https://recette.makeitpulse.com/tom-immo/articles/list
${bouton switch}    (.//*[normalize-space(text()) and normalize-space(.)='Gestion des articles'])[2]/following::label[1]
${ajout regroupement}    //*[@id="header1ItemList"]/div[1]/div[2]/button[1]
${Ajout Reg designation}    regroupementlabel
${Ajout Reg Code}    regroupementcode
${Ajout Reg ordre}    regroupementordre
${Ajout Reg verificateur}    inputFielduser
${franklin}    //*[@id="menuuser"]/div[3]/a
${Ajout Verfi}    //*[@id="modal-article"]/ngb-modal-window/div/div/app-ajout-regroupement/div/div[2]/div/div[2]/div/div/div/button
${btn Validation reg}    //*[@id="modal-article"]/ngb-modal-window/div/div/app-ajout-regroupement/div/div[3]/button[2]
#Gestion des articles (Regroupement)
${action Reg}    //*[@id="accordionSubList1"]/div[2]/div[9]/div[1]/div[1]/div/button
${action supr Reg}    //*[@id="accordionSubList1"]/div[2]/div[9]/div[1]/div[1]/div/div/div[3]
${Btn confirmation suppr}    //*[@id="modal-article"]/ngb-modal-window/div/div/app-confirmation-suppression/div/div[3]/button[2]

${Voir Details}    //*[@id="accordionSubList1"]/div[2]/div[11]/div[1]/div[1]/div/div/div[1]/span
${fermeture modale détails}    //*[@id="modal-article"]/ngb-modal-window/div/div/app-detail-regroupement/div/div[3]/button
${Modification}    //*[@id="accordionSubList1"]/div[2]/div[11]/div[1]/div[1]/div/div/div[2]/span
${valider modification}    //*[@id="modal-article"]/ngb-modal-window/div/div/app-ajout-regroupement/div/div[3]/button[2]

*** Keywords ***
Ajout Regroupement [integrationRegroupementwithRobot] 
    [Arguments]    ${ajout regroupement}    ${Ajout Reg designation}     ${Ajout Reg Code}    ${Ajout Reg ordre}    ${Ajout Reg verificateur}    ${franklin}    ${Ajout Verfi}    ${btn Validation reg}   
    Go to     https://recette.makeitpulse.com/tom-immo/articles/list
    Page Should Not Contain    integrationRegroupementwithRobot 
    Click element    ${ajout regroupement}
    Input Text    ${Ajout Reg designation}    integrationRegroupementwithRobot 
    Input Text    ${Ajout Reg Code}    V 
    Input Text    ${Ajout Reg ordre}    1
    Click element    ${Ajout Reg verificateur}
    Click element    ${franklin}
    Click element    ${Ajout Verfi}
    Click element    ${btn Validation reg}
    Capture Page Screenshot
    Sleep    10s

Voir détails Regroupement [integrationRegroupementwithRobot]
    [Arguments]    ${Voir Details}    ${fermeture modale détails}
    Click element    xpath=(.//*[@class='listAccordionSubItem-top']//button)[11]
    Click element    ${Voir Details} 
    Sleep    5s
    Click element    ${fermeture modale détails}



Modification Regroupement [integrationRegroupementwithRobot]
    [Arguments]    ${Modification}    ${Ajout Reg designation}    ${Ajout Reg Code}
    Sleep    5s
    Click element    ${Modification}
    Input Text    ${Ajout Reg designation}    regroupementEdited
    Input Text    ${Ajout Reg Code}    9 
    Click element    ${valider modification}


Voir détails Modifié Regroupement [regroupementEdited]
    [Arguments]    ${Voir Details}    ${fermeture modale détails}
    Sleep    5s
    Click element    xpath=(.//*[@class='listAccordionSubItem-top']//button)[11]
    Click element    ${Voir Details} 
    Sleep    5s
    Click element    ${fermeture modale détails}


Suppression du regroupement [integrationRegroupementwithRobot]
    Sleep    3s
    # Click Element  xpath=(.//*[@class='listAccordionSubItem-top']//button)[11]
    Click Element  xpath=(.//*[@class='action-sub-Item']//span)[43]
    Click Element  xpath=//*[@id="modal-article"]/ngb-modal-window/div/div/app-confirmation-suppression/div/div[3]/button[2]
    Sleep     2s
    Page Should Not Contain    integrationRegroupementwithRobot

