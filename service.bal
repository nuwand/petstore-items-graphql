import ballerina/graphql;

type Item record {
    readonly string id;
    string name;
    string description;
    string[] includes;
    string[] intendedFor;
    string[] colors;
    string [] material?;
    float price;
};

table<Item> key(id) itemsTable = table [
    {id: "1", name: "Top Paw® Valentine's Day Single Dog Sweater", description: "Dress your pup up appropriately for Valentine's Day with this Top " +
    "Paw Valentine's Day Kisses Dog Sweater.", includes: ["1 Sweater"], intendedFor: ["Dogs"], colors: ["Red", "White", "Black"], 
    material: ["100% Acrylic"], price: 14.99},

     {id: "2", name: "Arcadia Trail™ Dog Windbreaker", description: "The right jacket for your pet while the two of you are out on the trail together " +
     "can make all the difference when it comes to both warmth and comfort.", includes: ["1 Windbreaker Jacket"], intendedFor: ["Dogs"], colors: ["Pink", "Navy"], 
    price: 29.99},

    {id: "3", name: "Top Paw® Valentine's Day Kisses Dog Tee and Bandana", description: "Dress your pup up appropriately for Valentine's Day with this " +
    "Top Paw Valentine's Day Kisses Dog Tee and Bandana.", includes: ["1 Tee", "Bandana"], intendedFor: ["Dogs"], colors: ["White", "Red", "Black"], 
    material: ["T-Shirt: 65% Polyester", "35% Cotton; Bandana: 100% Cotton"], price: 7.47}
];

service / on new graphql:Listener(9000) {

resource function get all() returns Item[] {
    Item[] items = itemsTable.toArray().cloneReadOnly();
    return items;
}

}