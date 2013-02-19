module SourceDB
( openDB
, closeDB
, DBHandle
, addOrUpdateRecord
) where

import Control.Monad
import Database.SQLite

-- Configuration.
dbFilename = "clang-db.sqlite"

-- Schema for the database.
dbInt = SQLInt NORMAL True True
dbString = SQLVarChar 2048
dbPath = SQLVarChar 2048

sourceFileTable :: SQLTable
sourceFileTable = Table "SourceFiles"
                  [
                    Column "Path" dbPath [],
                    Column "BuildCommand" dbString []
                  ] []

schema = [sourceFileTable]

-- Database manipulation functions.
type DBHandle = SQLiteHandle

openDB :: IO DBHandle
openDB = do handle <- openConnection dbFilename
            ensureSchema handle
            return handle

closeDB :: DBHandle -> IO ()
closeDB = closeConnection

addOrUpdateRecord :: IO ()
addOrUpdateRecord = undefined

-- Checks that the database has the correct schema and sets it up if needed.
ensureSchema :: DBHandle -> IO ()
ensureSchema h = forM_ schema $ \table -> do
                   result <- defineTableOpt h True table
                   case result of
                     Just s -> error s
                     _      -> return ()
