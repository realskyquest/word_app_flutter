/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "umvcovy7ni2793x",
    "created": "2024-04-03 10:31:29.567Z",
    "updated": "2024-04-03 10:31:29.567Z",
    "name": "words",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "cfkmjmgf",
        "name": "field",
        "type": "json",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSize": 5000000
        }
      },
      {
        "system": false,
        "id": "vj1k2rcs",
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
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("umvcovy7ni2793x");

  return dao.deleteCollection(collection);
})
