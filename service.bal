import ballerina/graphql;

type StockDetails record {
    string includes;
    string intendedFor;
    string color;
    string material?;
};

type Item record {
    readonly string itemID;
    string itemName;
    string itemDesc;
    float price;
    StockDetails stockDetails;
};



table<Item> key(itemID) itemsTable = table [
    {itemID: "1", itemName: "Top Paw® Valentine's Day Single Dog Sweater", itemDesc: "Dress your pup up appropriately for Valentine's Day with this Top " +
    "Paw Valentine's Day Kisses Dog Sweater.", price: 14.99, stockDetails: {includes: "1 Sweater", intendedFor: "Dogs", color: "Red, White, Black", material: "100% Acrylic"}},

     {itemID: "2", itemName: "Arcadia Trail™ Dog Windbreaker", itemDesc: "The right jacket for your pet while the two of you are out on the trail together " +
     "can make all the difference when it comes to both warmth and comfort.", price: 29.99,  stockDetails: {includes: "1 Windbreaker Jacket", intendedFor: "Dogs", color: "Pink, Navy"}},

    {itemID: "3", itemName: "Top Paw® Valentine's Day Kisses Dog Tee and Bandana", itemDesc: "Dress your pup up appropriately for Valentine's Day with this " +
    "Top Paw Valentine's Day Kisses Dog Tee and Bandana.", stockDetails: {includes: "1 Tee, Bandana", intendedFor: "Dogs", color: "White, Red, Black", material: "T-Shirt: 65% Polyester, 35% Cotton; Bandana: 100% Cotton"}, 
    price: 7.47}
];

service / on new graphql:Listener(9000) {

resource function get all() returns Item[] {
    Item[] items = itemsTable.toArray().cloneReadOnly();
    return items;
}

}