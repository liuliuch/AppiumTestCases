*** Settings ***
Documentation    练习appium
Suite Setup         打开app
Suite Teardown      关闭app
Library    AppiumLibrary
*** Test Cases ***
test_demo1
    click element   com.example.notes:id/fab_expand_menu_button
    click element   com.example.notes:id/action_quick
    input text      com.example.notes:id/content_quick       hello1
    click element   //android.widget.TextView[@content-desc='完成']
    wait until page contains element        com.example.notes:id/fab_expand_menu_button

test_demo2
    click element   com.example.notes:id/fab_expand_menu_button
#    wait until page contains element
    click element   id=com.example.notes:id/action_note
    input text      id=com.example.notes:id/title_create       hello world
    input value      id=editor       hello2
    Capture Page Screenshot
    click element   //android.widget.TextView[@content-desc='完成']
    Capture Page Screenshot
    wait until page contains element        com.example.notes:id/fab_expand_menu_button



*** Keywords ***

打开app
    Open Application     http://localhost:4723/wd/hub   platformName=Android
    ...                  platformVersion=8.0.0          deviceName=Android Emulator
    ...                  automationName=appium          appPackage=com.example.notes
    ...                  appActivity=.Activity.MainActivity
    wait until page contains element        com.example.notes:id/fab_expand_menu_button

关闭app
    quit application
