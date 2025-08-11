# AltCurrencyTracker

**AltCurrencyTracker** is a lightweight addon that helps you track how much currency your other characters have—directly in the tooltip.

---

## Features

- Shows currency amounts for all your characters in currency tooltips
- Adds an "Other characters" section listing totals per character, sorted alphabetically by *Realm – Name*
- Automatically updates on login or when your currency totals change
- No setup or configuration needed
- Low memory usage with a single account-wide saved variable
- Includes localization for English, French, German, Spanish (EU & Latin America), Italian, Portuguese (Brazil), Russian, Korean, and Chinese (Simplified & Traditional)

---

## Usage

Hover over any currency in your character’s currency tab.  
The tooltip will display how much of that currency your other characters have.

Log in with each character once to populate the database.

---

## Data Storage

- Uses a per-account `AltCurrencyTrackerDB` saved variable
- Stores current currency amounts by item ID for each character
- Updates automatically during normal gameplay
- To reset, delete `AltCurrencyTrackerDB` from your `WTF` folder while the game is closed

---

## Limitations

- Only tracks currencies shown in the currency tab
- Characters must log in at least once to be recorded

---

## Support

Found a bug or have a suggestion?  
Open an issue here: [GitHub - Kalteew/AltCurrencyTracker](https://github.com/Kalteew/AltCurrencyTracker)

---

## License

This addon is open-source under the MIT License.

---

Thank you for using AltCurrencyTracker!
