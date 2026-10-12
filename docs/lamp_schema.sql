-- Lamp single-table schema for SwiftData model
-- Generated from Denk_Aan_Jou/Models/Lamp.swift (Dev branch)
-- Fields: id (UUID PK), name (TEXT), lampID (TEXT)
-- Notes:
--  - The Swift model defines `id: UUID`, `name: String`, `lampID: String`.
--  - `LampBericht` is an @Observable class (not @Model) and is not persisted.
--
-- PostgreSQL example (UUID type):
-- Requires the pgcrypto extension for gen_random_uuid():
--   CREATE EXTENSION IF NOT EXISTS pgcrypto;
--
CREATE TABLE lamp (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL DEFAULT '',
    lampID TEXT NOT NULL
);

-- SQLite example (SwiftData commonly uses SQLite under the hood):
-- Store UUIDs as TEXT
--
-- CREATE TABLE lamp (
--     id TEXT PRIMARY KEY, -- UUID stored as string
--     name TEXT NOT NULL DEFAULT '',
--     lampID TEXT NOT NULL
-- );

-- Usage notes:
--  - The `id` column corresponds to the Swift `UUID` primary key on the Lamp model.
--  - `name` and `lampID` are non-nullable in this schema, matching the initializer in Lamp.swift.
--  - If you want `name` to be nullable, change `TEXT NOT NULL` to `TEXT`.
--  - No foreign keys or relationships were inferred from the current models; this is a single-table schema.
