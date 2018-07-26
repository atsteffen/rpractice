#install.packages('jsonlite')
library(jsonlite)

newColumn <- function(index, label, key = "", type = "STRING", hidden = FALSE) {
  column <- list("index" = unlist(index),
                 "label" = label,
                 "key" = key,
                 "type" = type,
                 "hidden" = hidden)
  return(column)
}

newGroup <- function(columns, label = "", key = "") {
  group <- list("columns"=columns,
                "label"=label,
                "key"=key)
  return(group)
}

columns <- list(newColumn(0, "Food", key = "FOOD"),
             newColumn(1, "Carbs (g)", key = "CARB", type = "INTEGER"),
             newColumn(2, "Fat (g)", key = "FAT", type = "INTEGER"),
             newColumn(3, "Protein (g)", key = "PROTEIN", type = "INTEGER"),
             newColumn(4, "Price per unit", key = "PRICE", type = "DECIMAL"),
             newColumn(5, "Total units", key = "TOTAL", type = "DECIMAL"),
             newColumn(6, "Total sales", key = "SALES", type = "DECIMAL"),
             newColumn(7, "Barcode", type = "INTEGER", hidden = TRUE),
             newColumn(8, "Supplier", hidden = TRUE),
             newColumn(9, "Supplier code", type = "INTEGER", hidden = TRUE)
             )

groups <- list(newGroup(c(0, 7, 8, 9), key = "IDENTIFIER"),
            newGroup(c(1, 2, 3), label = "Nutrition facts", key = "NUTRITION"),
            newGroup(c(4, 5, 6), label = "Financial facts", key = "FINANCIAL")
            )

tableMeta <- list("columns" = columns, "groups" = groups)
tableMetaJson <- toJSON(tableMeta, auto_unbox = TRUE)
toJSON(tableMeta, auto_unbox = TRUE, pretty = TRUE)
