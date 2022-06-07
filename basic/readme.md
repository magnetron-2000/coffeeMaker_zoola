# Machine.rb
Here is basic example of coffee maker. Every instance must have some attributes:
* name - name of machine
* year - year of manufacture
* bean_volume - maximum size of bean basket
* material - what the machine is made of
* cup_volume - maximum size of cup

that get from user. Also there  are static attributes:
* fast_regime 
* switchedOn 
* temperature
* beans

which are defined (however the user can influence them).

Users have the ability to switch settings by methods:
* power - power on machine
* regime - changes the speed of preparation of the drink
* temperature - change the temperature in range 70..100

 -- and add more beans:
* add_beans

Finally you can order drink what you want(by methods):
* coffee
* capuchino
* hot chocolate

every method need know how much you want beans and water, and check the product's amount,
using private methods:
* check_beans_amount
* check_water_amount

