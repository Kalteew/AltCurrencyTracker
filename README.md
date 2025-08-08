# AltCurrencyTracker

AltCurrencyTracker is a lightweight World of Warcraft addon designed to keep track of the currencies collected by each of your characters. It records currency amounts on every login or whenever your currency totals change and then displays this information directly in currency tooltips. This makes it easy to see how much of a given currency your alternate characters have without logging over to them.

## Features
- Stores the quantity of each tracked currency for all characters on the account.
- Adds a section to currency tooltips showing the amounts held by your other characters.
- Updates automatically when you earn or spend currency.

## Installation
1. Download or clone this repository.
2. Copy the entire `AltCurrencyTracker` folder into your `World of Warcraft/_retail_/Interface/AddOns` directory.
3. Launch the game and make sure the addon is enabled at the character selection screen.

## Usage
Simply hover over a currency in your currency panel. The tooltip will list the amount of that currency owned by your other characters.

No slash commands or additional configuration are required.

## Saved Variables
The addon stores its data in the `AltCurrencyTrackerDB` saved variable. If you wish to reset the stored data, you can delete this entry from your `WTF` folder while the game is closed.

## License
This project is released under the MIT License.
