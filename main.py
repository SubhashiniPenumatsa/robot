# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and set
from selenium import webdriver

username = "abc@info.com"
password = "test123"

url = "http://rental30.infotiv.net"

driver = webdriver.Chrome("C:\\Users\\SubhashiniPenumatsa\\Webdriver\\chromedriver")

driver.get(url)
driver.find_element_by_id("email").send_keys(username)
driver.find_element_by_id("password").send_keys(password)
driver.find_element_by_id("login").click()
def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
