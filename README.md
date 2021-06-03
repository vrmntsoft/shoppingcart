# README

This function relies on 3 calls, Create Basket, Add Item to Basket and finally Checkout

To start, call the Create Basket function to get a basket id.

Using the basket ID call Add Item as many times as needed to add various items to the cart.

When ready, final step is to Call Checkout using the Basket ID.


API Calls

1. Create Basket

call (POST): http://<server>/basket

CreateBasket Response

{
    "basket_id": "617f2566-749a-4758-8b93-1f90a6f76580"
}

2. Add Item

call (POST) : http://<server>/basket/<basket id>/add

AddItem Request
{
    "item_name": "Infrared Thermometer",
    "item_price": 24.95,
    "food_or_medical": true,
    "imported": true
}

AddItem Response
{
    "id": 2,
    "trans_id": "617f2566-749a-4758-8b93-1f90a6f76580",
    "item_name": "Infrared Thermometer",
    "item_price": 24.95,
    "item_quantity": 1,
    "food_or_medical": false,
    "imported": true,
    "created_at": "2021-06-03T15:38:07.975Z",
    "updated_at": "2021-06-03T15:38:07.975Z"
}

3. Checkout

call (GET) : http://<server>/basket/<basket id>/checkout

Checkout Response
{
    "header": {
        "receipt_dttm": "03/06/21 15:49:58",
        "item_totals": "40.5",
        "tax_total": "3.57",
        "purchase_total": "44.07"
    },
    "lines": [
        {
            "item_name": "Star Wars IV - A New Hope - Blu-ray",
            "item_quantity": 2,
            "tax_amount": "3.5700000000000003",
            "item_cost": "39.25"
        },
        {
            "item_name": "Salted Peanuts Can",
            "item_quantity": 1,
            "tax_amount": "0.0",
            "item_cost": "1.25"
        }
    ]
}

