<h1 align="center">
  TRZ (The Resident Zombie) - Backend
</h1>

## :mag_right: Database diagram

<p align="center">
  <img alt="diagram" src="https://user-images.githubusercontent.com/40550247/112885226-e1ab4180-90a6-11eb-8576-0743b3b74fc0.png" />
</p>

## :dart: ToDo
  - [x] Add survivors to the database
    - A survivor must have a name, age, gender and last location (latitude, longitude). We want this database to be accurate, so add basic validation for each field. Each survivor has their inventory of resources/items. The survivor must declare all of their resources in the sign-up process. We will believe they have what they say they have. 
  - [x] Update survivor location
    - A survivor must have the ability to update their last location, storing the new latitude/longitude pair in the base (no need to track locations, just replacing the previous one is enough).
  - [x] Flag survivor as infected
    - In a chaotic situation like that, a survivor may inevitably get contaminated by the virus. When this happens, we need to flag the survivor as infected. An infected survivor cannot trade with others, can't access/manipulate their inventory, nor be listed in the reports (infected people are kinda dead anyway, see the item on reports below). So sad when people fall for the Influenzer T-Virus.
    A survivor is marked as infected when at least five other survivors report their contamination. When a survivor is infected, their inventory items become inaccessible (they cannot trade with others). This rule HAS to be enforced in this backend system.
  - [] Survivors cannot Add/Remove items from inventory
    - A new user must register their belongings alongside the sign-up process. After that, they can only change their catalog through trading with other survivors. Make sure that an error in the system doesn't end up with corrupted data! The items allowed in the inventory are described above in the first feature.
  - [] Trade items
    - Survivors can trade items among themselves. To do that, they must respect the price table below, where the value of an item is described in terms of points. Both sides of the trade should offer the same amount of points. For example, 5 Fiji water and 5 first aid pouch (5 x 14 + 5 x 10) are worth 6 AK47 (6 x 8) plus 6 Cambell Soups (6 x 12) - and yes, you will die without water for a day. You'll also die if you have a severe untreated wound. That's why those items are more expensive than weapons and food! The API won't store the trades, but the items will be transferred from one survivor to the other.
  - [] Reports
    - The API must offer the following reports:
    1. Percentage of infected survivors.
    1. Percentage of non-infected survivors.
    3. The average amount of each kind of resource by the survivor (e.g. 10 Fiji Waters per survivor)
    4. Points lost because of an infected survivor.
