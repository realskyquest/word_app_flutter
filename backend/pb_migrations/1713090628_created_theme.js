/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "5f0rmlt16czrzkr",
    "created": "2024-04-14 10:30:28.750Z",
    "updated": "2024-04-14 10:30:28.750Z",
    "name": "theme",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "joabtwvc",
        "name": "mode",
        "type": "bool",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "poqpdcwx",
        "name": "user",
        "type": "relation",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "collectionId": "_pb_users_auth_",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
        }
      }
    ],
    "indexes": [],
    "listRule": "",
    "viewRule": "",
    "createRule": "",
    "updateRule": "",
    "deleteRule": "",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("5f0rmlt16czrzkr");

  return dao.deleteCollection(collection);
})
