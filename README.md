ShopperBot-iOS-App
==================

This is an app implementing an e-grocery store.

This file contains details of different views and their view controllers used in app.
(Standard protocol methods that need to be implemented for a controller are not described)

MAIN PARENT:
MainViewController: 
It has following views and methods:
CartBar: cart bar at bottom.
Container view that loads other views in it.
METHODS:
setCartBarLabel: set label showing total of cart.
modifyBadge: to set the badge on top right of cart.
modifyViewOfCartBarOnStarting: to set frames of cart bar and container view depending on whether cart contains something.
modifyCheckOutButton: set appearance of checkout button on cart bar
setObservers: set observers for this class to get notifications from default notification center to manage labels of cart bar
CHECKOUT:
CheckOutViewController: 
It has following views and methods:
topBarWithCompletionCircles: top bar view with circles and back button
Container view that loads another views.
METHODS:
changeViewOfTopBar: manages appearance of image views of top bar as the views in container view change.
setObservers: observers to listen to change in view of container view.
ShippingViewController: 
controller of view that prompts user to enter address, city, pin
It has following methods:
loadPinArray: loads pin array for picker view of pin
loadCityArray: loads city array for picker view of city
modifyNextButton: adjusts appearance of next button
adjustPickers: sets picker views as input for the appropriate text fields.
add doneToolBarToKeyboard: to add done to keyboard that appears on clicking on textfield of address.
timingViewController:
view that prompts user to select day and time of delivery of goods.
It has following methods:
modifyDateArrayForPicker:sets the array of date to be displayed in picker.
modifyTimeSlotArrayForPicker:sets the array of time slots to be displayed in picker.
paymentViewController:
controller of view that prompts user to select mode of payement.Consists of a picker that displays mode of payments
checkoutSegue: 
a subclass of UIStoryBoard segue that performs segue in views of container.
CART:
CartViewController: a subclass of table view controller that displays the current cart of user.Can be displayed by pressing cart button or swiping up on cartbar.
METHODS:
setTotalLabels: calculates total amount of cart and sets the value of total of cart.
formatButtons: sets appearance of checkout and back button.
CartCellView: a class that manages cells of table view of CartViewController.
FIRST SCREEN:
CategoryViewController:
subclass of collection view controller that displays categories as collection view.
METHODS:
downloadCategoryJSON: to download JSON from server in array of categories asynchronously using AFNetworking.
prepareforsegue: sends the unique identity associated with cells of main category view while segueing to second collection view to determine which sub categories to be loaded.
SUB CATEGORY SCREEN:
SecondViewController:
a subclass a viewpagercontroller(3rd party library ICViewPager) to display slidable top bar with title of subcategores.It has a subview secondCollectionViewController that displays products in collection view.
METHODS:
downloadSubCategoryJSON: to download JSON of SubCategories.
SecondCollectionView:
displays products in collection view.
METHODS:
downloadProductJSON: to download JSON of product.
MODULES:
Consists of helper classes.
interactWithCoreData:
class that helps to get, modify and read the present cart stored as core data.
METHODS:
getContext: to get a context to core data.
getActiveCartWithContext: to get presentcart with given context as a parameter.
customizeCart:
class with methods to change the cart values.
METHODS:
getLabelValue: get total number of different items in string format.
getTotalLabels: get the total value/amount of cart.
URLs:
class with methods to get appropriate URLs to download JSON.
colors:
class with methods to get appropriate colors.
