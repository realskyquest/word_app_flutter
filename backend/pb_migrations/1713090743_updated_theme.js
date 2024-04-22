/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5f0rmlt16czrzkr")

  // remove
  collection.schema.removeField("joabtwvc")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "djdfgk8d",
    "name": "mode",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "light",
        "dark"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5f0rmlt16czrzkr")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "joabtwvc",
    "name": "mode",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // remove
  collection.schema.removeField("djdfgk8d")

  return dao.saveCollection(collection)
})
