# AltCurrencyTracker

AltCurrencyTracker is a simple World of Warcraft addon that tracks your in-game currencies on all characters. When you hover a currency in the currency tab, the tooltip lists how much each of your other characters has collected.

## Installation

1. Download or clone this repository.
2. Copy the `AltCurrencyTracker` folder into your WoW `Interface/AddOns` directory.
3. Launch the game and make sure the addon is enabled on the character selection screen.

## Usage

The addon works automatically once installed. Currencies are recorded for each character when you log in or when the currency window updates. Hovering a currency will show additional lines in the tooltip with the amounts held by your other characters.

## Saved Data

Currency information is stored in the saved variable `AltCurrencyTrackerDB` inside your `WTF` folder. Removing this file will reset all stored data.

## License

This project is provided as-is without any warranty. Feel free to modify it for personal use.
