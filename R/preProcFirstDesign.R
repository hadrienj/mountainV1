
# library(couchDB)
# test <- jsonlite::fromJSON(getURL("https://hhh:sclavis@audiitory.iriscouch.com/ab21/_all_docs?include_docs=true"))
# test1 <- test$rows$doc

# Import Json file
json.file.sa20 <- "./raw_data/sa20.txt"
json.data.sa20 <- jsonlite::fromJSON(json.file.sa20)
# Put data in a data frame
raw.data.sa20 <- json.data.sa20$rows$doc
raw.data.sa20$name <-"sa20"
raw.data.sa20$sessionNumMount <- "1"
raw.data.sa20$trainSession <-"0"

# Import Json file
json.file.ab22 <- "./raw_data/ab22.txt"
json.data.ab22 <- jsonlite::fromJSON(json.file.ab22)
# Put data in a data frame
raw.data.ab22 <- json.data.ab22$rows$doc
raw.data.ab22$name <-"ab22"
raw.data.ab22$sessionNumMount <- "1"
raw.data.ab22$trainSession <-"0"

# Import Json file
json.file.dd04 <- "./raw_data/dd04.txt"
json.data.dd04 <- jsonlite::fromJSON(json.file.dd04)
# Put data in a data frame
raw.data.dd04 <- json.data.dd04$rows$doc
raw.data.dd04$name <-"dd04"
raw.data.dd04$sessionNumMount <- "1"
raw.data.dd04$trainSession <-"0"
raw.data.dd04$tonePosX <- NA
raw.data.dd04$tonePosY <- NA

# Import Json file
json.file.ap08 <- "./raw_data/ap08.txt"
json.data.ap08 <- jsonlite::fromJSON(json.file.ap08)
# Put data in a data frame
raw.data.ap08 <- json.data.ap08$rows$doc
raw.data.ap08$name <-"ap08"
raw.data.ap08$sessionNumMount <- "1"
raw.data.ap08$trainSession <-"0"
raw.data.ap08$tonePosX <- NA
raw.data.ap08$tonePosY <- NA

# Import Json file
json.file.shr28 <- "./raw_data/shr28.txt"
json.data.shr28 <- jsonlite::fromJSON(json.file.shr28)
# Put data in a data frame
raw.data.shr28 <- json.data.shr28$rows$doc
raw.data.shr28$name <-"shr28"
raw.data.shr28$sessionNumMount <- "1"
raw.data.shr28$trainSession <-"0"
raw.data.shr28$tonePosX <- NA
raw.data.shr28$tonePosY <- NA

# Import Json file
json.file.hj12 <- "./raw_data/hj12.txt"
json.data.hj12 <- jsonlite::fromJSON(json.file.hj12)
# Put data in a data frame
raw.data.hj12 <- json.data.hj12$rows$doc
raw.data.hj12$name <-"hj12"
raw.data.hj12$sessionNumMount <- "1"
raw.data.hj12$trainSession <-"0"
raw.data.hj12$tonePosX <- NA
raw.data.hj12$tonePosY <- NA

# Import Json file
json.file.ll07_proc <- "./raw_data/ll07_proc.txt"
json.data.ll07_proc <- jsonlite::fromJSON(json.file.ll07_proc)
# Put data in a data frame
raw.data.ll07_proc <- json.data.ll07_proc$rows$doc
raw.data.ll07_proc$name <-"ll07"
raw.data.ll07_proc$sessionNumMount <- "1"
raw.data.ll07_proc$trainSession <-"0"
raw.data.ll07_proc$tonePosX <- NA
raw.data.ll07_proc$tonePosY <- NA

# Import Json file
json.file.va01 <- "./raw_data/va01.txt"
json.data.va01 <- jsonlite::fromJSON(json.file.va01)
# Put data in a data frame
raw.data.va01 <- json.data.va01$rows$doc
raw.data.va01$name <-"va01"
raw.data.va01$sessionNumMount <- "1"
raw.data.va01$trainSession <-"0"
raw.data.va01$tonePosX <- NA
raw.data.va01$tonePosY <- NA

# Import Json file
json.file.df22 <- "./raw_data/df22.txt"
json.data.df22 <- jsonlite::fromJSON(json.file.df22)
# Put data in a data frame
raw.data.df22 <- json.data.df22$rows$doc
raw.data.df22$name <-"df22"
raw.data.df22$sessionNumMount <- "1"
raw.data.df22$trainSession <-"0"
raw.data.df22$tonePosX <- NA
raw.data.df22$tonePosY <- NA

# Import Json file
json.file.ab21 <- "./raw_data/ab21.txt"
json.data.ab21 <- jsonlite::fromJSON(json.file.ab21)
# Put data in a data frame
raw.data.ab21 <- json.data.ab21$rows$doc
raw.data.ab21$name <-"ab21"
raw.data.ab21$sessionNumMount <- "1"
raw.data.ab21$trainSession <-"0"
raw.data.ab21$tonePosX <- NA
raw.data.ab21$tonePosY <- NA

# Import Json file
json.file.jc08 <- "./raw_data/jc08.txt"
json.data.jc08 <- jsonlite::fromJSON(json.file.jc08)
# Put data in a data frame
raw.data.jc08 <- json.data.jc08$rows$doc
raw.data.jc08$name <-"jc08"
raw.data.jc08$sessionNumMount <- "1"
raw.data.jc08$trainSession <-"0"
raw.data.jc08$tonePosX <- NA
raw.data.jc08$tonePosY <- NA

# Import Json file
json.file.gw25 <- "./raw_data/gw25.txt"
json.data.gw25 <- jsonlite::fromJSON(json.file.gw25)
# Put data in a data frame
raw.data.gw25 <- json.data.gw25$rows$doc
raw.data.gw25$name <-"gw25"
raw.data.gw25$sessionNumMount <- "1"
raw.data.gw25$trainSession <-"0"
raw.data.gw25$tonePosX <- NA
raw.data.gw25$tonePosY <- NA

# Import Json file
json.file.mn15 <- "./raw_data/mn15.txt"
json.data.mn15 <- jsonlite::fromJSON(json.file.mn15)
# Put data in a data frame
raw.data.mn15 <- json.data.mn15$rows$doc
raw.data.mn15$name <-"mn15"
raw.data.mn15$sessionNumMount <- "1"
raw.data.mn15$trainSession <-"0"
raw.data.mn15$tonePosX <- NA
raw.data.mn15$tonePosY <- NA

# Import Json file
json.file.el20 <- "./raw_data/el20.txt"
json.data.el20 <- jsonlite::fromJSON(json.file.el20)
# Put data in a data frame
raw.data.el20 <- json.data.el20$rows$doc
raw.data.el20$name <-"el20"
raw.data.el20$sessionNumMount <- "1"
raw.data.el20$trainSession <-"0"
raw.data.el20$tonePosX <- NA
raw.data.el20$tonePosY <- NA

# Import Json file
json.file.jd12 <- "./raw_data/jd12.txt"
json.data.jd12 <- jsonlite::fromJSON(json.file.jd12)
# Put data in a data frame
raw.data.jd12 <- json.data.jd12$rows$doc
raw.data.jd12$name <-"jd12"
raw.data.jd12$sessionNumMount <- "1"
raw.data.jd12$trainSession <-"0"
raw.data.jd12$tonePosX <- NA
raw.data.jd12$tonePosY <- NA

# Import Json file
json.file.hp02 <- "./raw_data/hp02.txt"
json.data.hp02 <- jsonlite::fromJSON(json.file.hp02)
# Put data in a data frame
raw.data.hp02 <- json.data.hp02$rows$doc
raw.data.hp02$name <-"hp02"
raw.data.hp02$sessionNumMount <- "1"
raw.data.hp02$trainSession <-"0"
raw.data.hp02$tonePosX <- NA
raw.data.hp02$tonePosY <- NA

# Import Json file
json.file.va01_2 <- "./raw_data/va01_2.txt"
json.data.va01_2 <- jsonlite::fromJSON(json.file.va01_2)
# Put data in a data frame
raw.data.va01_2 <- json.data.va01_2$rows$doc
raw.data.va01_2$name <-"va01"
raw.data.va01_2$sessionNumMount <- "2"
raw.data.va01_2$trainSession <-"1"
raw.data.va01_2$tonePosX <- NA
raw.data.va01_2$tonePosY <- NA

# Import Json file
json.file.df22_2 <- "./raw_data/df22_2.txt"
json.data.df22_2 <- jsonlite::fromJSON(json.file.df22_2)
# Put data in a data frame
raw.data.df22_2 <- json.data.df22_2$rows$doc
raw.data.df22_2$name <-"df22"
raw.data.df22_2$sessionNumMount <- "2"
raw.data.df22_2$trainSession <-"1"
raw.data.df22_2$tonePosX <- NA
raw.data.df22_2$tonePosY <- NA

# Import Json file
json.file.va01_3 <- "./raw_data/va01_3.txt"
json.data.va01_3 <- jsonlite::fromJSON(json.file.va01_3)
# Put data in a data frame
raw.data.va01_3 <- json.data.va01_3$rows$doc
raw.data.va01_3$name <-"va01"
raw.data.va01_3$sessionNumMount <- "3"
raw.data.va01_3$trainSession <-"2"
raw.data.va01_3$tonePosX <- NA
raw.data.va01_3$tonePosY <- NA

# Import Json file
json.file.df22_3 <- "./raw_data/df22_3.txt"
json.data.df22_3 <- jsonlite::fromJSON(json.file.df22_3)
# Put data in a data frame
raw.data.df22_3 <- json.data.df22_3$rows$doc
raw.data.df22_3$name <-"df22"
raw.data.df22_3$sessionNumMount <- "3"
raw.data.df22_3$trainSession <-"2"
raw.data.df22_3$tonePosX <- NA
raw.data.df22_3$tonePosY <- NA

# Import Json file
json.file.va01_4 <- "./raw_data/va01_4.txt"
json.data.va01_4 <- jsonlite::fromJSON(json.file.va01_4)
# Put data in a data frame
raw.data.va01_4 <- json.data.va01_4$rows$doc
raw.data.va01_4$name <-"va01"
raw.data.va01_4$sessionNumMount <- "4"
raw.data.va01_4$trainSession <-"3"
raw.data.va01_4$tonePosX <- NA
raw.data.va01_4$tonePosY <- NA

# Import Json file
json.file.df22_4 <- "./raw_data/df22_4.txt"
json.data.df22_4 <- jsonlite::fromJSON(json.file.df22_4)
# Put data in a data frame
raw.data.df22_4 <- json.data.df22_4$rows$doc
raw.data.df22_4$name <-"df22"
raw.data.df22_4$sessionNumMount <- "4"
raw.data.df22_4$trainSession <-"3"
raw.data.df22_4$tonePosX <- NA
raw.data.df22_4$tonePosY <- NA

# Import Json file
json.file.va01_5 <- "./raw_data/va01_5.txt"
json.data.va01_5 <- jsonlite::fromJSON(json.file.va01_5)
# Put data in a data frame
raw.data.va01_5 <- json.data.va01_5$rows$doc
raw.data.va01_5$name <-"va01"
raw.data.va01_5$sessionNumMount <- "5"
raw.data.va01_5$trainSession <-"4"
raw.data.va01_5$tonePosX <- NA
raw.data.va01_5$tonePosY <- NA

# Import Json file
json.file.df22_5 <- "./raw_data/df22_5.txt"
json.data.df22_5 <- jsonlite::fromJSON(json.file.df22_5)
# Put data in a data frame
raw.data.df22_5 <- json.data.df22_5$rows$doc
raw.data.df22_5$name <-"df22"
raw.data.df22_5$sessionNumMount <- "5"
raw.data.df22_5$trainSession <-"4"
raw.data.df22_5$tonePosX <- NA
raw.data.df22_5$tonePosY <- NA

# Import Json file
json.file.ss28 <- "./raw_data/ss28.txt"
json.data.ss28 <- jsonlite::fromJSON(json.file.ss28)
# Put data in a data frame
raw.data.ss28 <- json.data.ss28$rows$doc
raw.data.ss28$name <-"ss28"
raw.data.ss28$sessionNumMount <- "1"
raw.data.ss28$trainSession <-"0"
raw.data.ss28$tonePosX <- NA
raw.data.ss28$tonePosY <- NA

# Import Json file
json.file.lj01 <- "./raw_data/lj01_proc.txt"
json.data.lj01 <- jsonlite::fromJSON(json.file.lj01)
# Put data in a data frame
raw.data.lj01 <- json.data.lj01$rows$doc
raw.data.lj01$name <-"lj01"
raw.data.lj01$sessionNumMount <- "1"
raw.data.lj01$trainSession <-"0"
raw.data.lj01$tonePosX <- NA
raw.data.lj01$tonePosY <- NA

########## Second longitudinal study ##########

# Import Json file
json.file.dp02 <- "./raw_data/dp02.txt"
json.data.dp02 <- jsonlite::fromJSON(json.file.dp02)
# Put data in a data frame
raw.data.dp02 <- json.data.dp02$rows$doc
raw.data.dp02$name <-"dp02"
raw.data.dp02$sessionNumMount <- "1"
raw.data.dp02$trainSession <-"0"
raw.data.dp02$tonePosX <- NA
raw.data.dp02$tonePosY <- NA

# Import Json file
json.file.dp02_1 <- "./raw_data/dp02_1.txt"
json.data.dp02_1 <- jsonlite::fromJSON(json.file.dp02_1)
# Put data in a data frame
raw.data.dp02_1 <- json.data.dp02_1$rows$doc
raw.data.dp02_1$name <-"dp02"
raw.data.dp02_1$sessionNumMount <- "2"
raw.data.dp02_1$trainSession <-"1"
raw.data.dp02_1$tonePosX <- NA
raw.data.dp02_1$tonePosY <- NA

json.file.dp02_2 <- "./raw_data/dp02_2.txt"
json.data.dp02_2 <- jsonlite::fromJSON(json.file.dp02_2)
# Put data in a data frame
raw.data.dp02_2 <- json.data.dp02_2$rows$doc
raw.data.dp02_2$name <-"dp02"
raw.data.dp02_2$sessionNumMount <- "3"
raw.data.dp02_2$trainSession <-"2"
raw.data.dp02_2$tonePosX <- NA
raw.data.dp02_2$tonePosY <- NA

json.file.dp02_3 <- "./raw_data/dp02_3.txt"
json.data.dp02_3 <- jsonlite::fromJSON(json.file.dp02_3)
# Put data in a data frame
raw.data.dp02_3 <- json.data.dp02_3$rows$doc
raw.data.dp02_3$name <-"dp02"
raw.data.dp02_3$sessionNumMount <- "4"
raw.data.dp02_3$trainSession <-"3"
raw.data.dp02_3$tonePosX <- NA
raw.data.dp02_3$tonePosY <- NA

json.file.dp02_4 <- "./raw_data/dp02_4.txt"
json.data.dp02_4 <- jsonlite::fromJSON(json.file.dp02_4)
# Put data in a data frame
raw.data.dp02_4 <- json.data.dp02_4$rows$doc
raw.data.dp02_4$name <-"dp02"
raw.data.dp02_4$sessionNumMount <- "5"
raw.data.dp02_4$trainSession <-"4"
raw.data.dp02_4$tonePosX <- NA
raw.data.dp02_4$tonePosY <- NA


# Import Json file
json.file.el17 <- "./raw_data/el17.txt"
json.data.el17 <- jsonlite::fromJSON(json.file.el17)
# Put data in a data frame
raw.data.el17 <- json.data.el17$rows$doc
raw.data.el17$name <-"el17"
raw.data.el17$sessionNumMount <- "1"
raw.data.el17$trainSession <-"0"
raw.data.el17$tonePosX <- NA
raw.data.el17$tonePosY <- NA

# Import Json file
json.file.el17_1 <- "./raw_data/el17_1.txt"
json.data.el17_1 <- jsonlite::fromJSON(json.file.el17_1)
# Put data in a data frame
raw.data.el17_1 <- json.data.el17_1$rows$doc
raw.data.el17_1$name <-"el17"
raw.data.el17_1$sessionNumMount <- "2"
raw.data.el17_1$trainSession <-"1"
raw.data.el17_1$tonePosX <- NA
raw.data.el17_1$tonePosY <- NA

json.file.el17_2 <- "./raw_data/el17_2.txt"
json.data.el17_2 <- jsonlite::fromJSON(json.file.el17_2)
# Put data in a data frame
raw.data.el17_2 <- json.data.el17_2$rows$doc
raw.data.el17_2$name <-"el17"
raw.data.el17_2$sessionNumMount <- "3"
raw.data.el17_2$trainSession <-"2"
raw.data.el17_2$tonePosX <- NA
raw.data.el17_2$tonePosY <- NA

json.file.el17_3 <- "./raw_data/el17_3.txt"
json.data.el17_3 <- jsonlite::fromJSON(json.file.el17_3)
# Put data in a data frame
raw.data.el17_3 <- json.data.el17_3$rows$doc
raw.data.el17_3$name <-"el17"
raw.data.el17_3$sessionNumMount <- "4"
raw.data.el17_3$trainSession <-"3"
raw.data.el17_3$tonePosX <- NA
raw.data.el17_3$tonePosY <- NA

json.file.el17_4 <- "./raw_data/el17_4.txt"
json.data.el17_4 <- jsonlite::fromJSON(json.file.el17_4)
# Put data in a data frame
raw.data.el17_4 <- json.data.el17_4$rows$doc
raw.data.el17_4$name <-"el17"
raw.data.el17_4$sessionNumMount <- "5"
raw.data.el17_4$trainSession <-"4"
raw.data.el17_4$tonePosX <- NA
raw.data.el17_4$tonePosY <- NA

# Import Json file
json.file.kh13_proc <- "./raw_data/kh13_proc.txt"
json.data.kh13_proc <- jsonlite::fromJSON(json.file.kh13_proc)
# Put data in a data frame
raw.data.kh13_proc <- json.data.kh13_proc$rows$doc
raw.data.kh13_proc$name <-"kh13"
raw.data.kh13_proc$sessionNumMount <- "1"
raw.data.kh13_proc$trainSession <-"0"
raw.data.kh13_proc$tonePosX <- NA
raw.data.kh13_proc$tonePosY <- NA

# Import Json file
json.file.kh13_1 <- "./raw_data/kh13_1.txt"
json.data.kh13_1 <- jsonlite::fromJSON(json.file.kh13_1)
# Put data in a data frame
raw.data.kh13_1 <- json.data.kh13_1$rows$doc
raw.data.kh13_1$name <-"kh13"
raw.data.kh13_1$sessionNumMount <- "2"
raw.data.kh13_1$trainSession <-"1"
raw.data.kh13_1$tonePosX <- NA
raw.data.kh13_1$tonePosY <- NA

json.file.kh13_2 <- "./raw_data/kh13_2.txt"
json.data.kh13_2 <- jsonlite::fromJSON(json.file.kh13_2)
# Put data in a data frame
raw.data.kh13_2 <- json.data.kh13_2$rows$doc
raw.data.kh13_2$name <-"kh13"
raw.data.kh13_2$sessionNumMount <- "3"
raw.data.kh13_2$trainSession <-"2"
raw.data.kh13_2$tonePosX <- NA
raw.data.kh13_2$tonePosY <- NA

json.file.kh13_3 <- "./raw_data/kh13_3.txt"
json.data.kh13_3 <- jsonlite::fromJSON(json.file.kh13_3)
# Put data in a data frame
raw.data.kh13_3 <- json.data.kh13_3$rows$doc
raw.data.kh13_3$name <-"kh13"
raw.data.kh13_3$sessionNumMount <- "4"
raw.data.kh13_3$trainSession <-"3"
raw.data.kh13_3$tonePosX <- NA
raw.data.kh13_3$tonePosY <- NA

json.file.kh13_4 <- "./raw_data/kh13_4.txt"
json.data.kh13_4 <- jsonlite::fromJSON(json.file.kh13_4)
# Put data in a data frame
raw.data.kh13_4 <- json.data.kh13_4$rows$doc
raw.data.kh13_4$name <-"kh13"
raw.data.kh13_4$sessionNumMount <- "5"
raw.data.kh13_4$trainSession <-"4"
raw.data.kh13_4$tonePosX <- NA
raw.data.kh13_4$tonePosY <- NA

# Import Json file
json.file.ss10_proc <- "./raw_data/ss10_proc.txt"
json.data.ss10_proc <- jsonlite::fromJSON(json.file.ss10_proc)
# Put data in a data frame
raw.data.ss10_proc <- json.data.ss10_proc$rows$doc
raw.data.ss10_proc$name <-"ss10"
raw.data.ss10_proc$sessionNumMount <- "1"
raw.data.ss10_proc$trainSession <-"0"
raw.data.ss10_proc$tonePosX <- NA
raw.data.ss10_proc$tonePosY <- NA

# Import Json file
json.file.ss10_1 <- "./raw_data/ss10_1.txt"
json.data.ss10_1 <- jsonlite::fromJSON(json.file.ss10_1)
# Put data in a data frame
raw.data.ss10_1 <- json.data.ss10_1$rows$doc
raw.data.ss10_1$name <-"ss10"
raw.data.ss10_1$sessionNumMount <- "2"
raw.data.ss10_1$trainSession <-"1"
raw.data.ss10_1$tonePosX <- NA
raw.data.ss10_1$tonePosY <- NA

json.file.ss10_2_proc <- "./raw_data/ss10_2_proc.txt"
json.data.ss10_2_proc <- jsonlite::fromJSON(json.file.ss10_2_proc)
# Put data in a data frame
raw.data.ss10_2_proc <- json.data.ss10_2_proc$rows$doc
raw.data.ss10_2_proc$name <-"ss10"
raw.data.ss10_2_proc$sessionNumMount <- "3"
raw.data.ss10_2_proc$trainSession <-"2"
raw.data.ss10_2_proc$tonePosX <- NA
raw.data.ss10_2_proc$tonePosY <- NA

json.file.ss10_3 <- "./raw_data/ss10_3.txt"
json.data.ss10_3 <- jsonlite::fromJSON(json.file.ss10_3)
# Put data in a data frame
raw.data.ss10_3 <- json.data.ss10_3$rows$doc
raw.data.ss10_3$name <-"ss10"
raw.data.ss10_3$sessionNumMount <- "4"
raw.data.ss10_3$trainSession <-"3"
raw.data.ss10_3$tonePosX <- NA
raw.data.ss10_3$tonePosY <- NA

json.file.ss10_4 <- "./raw_data/ss10_4.txt"
json.data.ss10_4 <- jsonlite::fromJSON(json.file.ss10_4)
# Put data in a data frame
raw.data.ss10_4 <- json.data.ss10_4$rows$doc
raw.data.ss10_4$name <-"ss10"
raw.data.ss10_4$sessionNumMount <- "5"
raw.data.ss10_4$trainSession <-"4"
raw.data.ss10_4$tonePosX <- NA
raw.data.ss10_4$tonePosY <- NA


# Import Json file
json.file.vv17 <- "./raw_data/vv17.txt"
json.data.vv17 <- jsonlite::fromJSON(json.file.vv17)
# Put data in a data frame
raw.data.vv17 <- json.data.vv17$rows$doc
raw.data.vv17$name <-"vv17"
raw.data.vv17$sessionNumMount <- "1"
raw.data.vv17$trainSession <-"0"
raw.data.vv17$tonePosX <- NA
raw.data.vv17$tonePosY <- NA

# Import Json file
json.file.vv17_1_proc <- "./raw_data/vv17_1_proc.txt"
json.data.vv17_1_proc <- jsonlite::fromJSON(json.file.vv17_1_proc)
# Put data in a data frame
raw.data.vv17_1_proc <- json.data.vv17_1_proc$rows$doc
raw.data.vv17_1_proc$name <-"vv17"
raw.data.vv17_1_proc$sessionNumMount <- "2"
raw.data.vv17_1_proc$trainSession <-"1"
raw.data.vv17_1_proc$tonePosX <- NA
raw.data.vv17_1_proc$tonePosY <- NA

json.file.vv17_2_proc <- "./raw_data/vv17_2_proc.txt"
json.data.vv17_2_proc <- jsonlite::fromJSON(json.file.vv17_2_proc)
# Put data in a data frame
raw.data.vv17_2_proc <- json.data.vv17_2_proc$rows$doc
raw.data.vv17_2_proc$name <-"vv17"
raw.data.vv17_2_proc$sessionNumMount <- "3"
raw.data.vv17_2_proc$trainSession <-"2"
raw.data.vv17_2_proc$tonePosX <- NA
raw.data.vv17_2_proc$tonePosY <- NA

json.file.vv17_3 <- "./raw_data/vv17_3.txt"
json.data.vv17_3 <- jsonlite::fromJSON(json.file.vv17_3)
# Put data in a data frame
raw.data.vv17_3 <- json.data.vv17_3$rows$doc
raw.data.vv17_3$name <-"vv17"
raw.data.vv17_3$sessionNumMount <- "4"
raw.data.vv17_3$trainSession <-"3"
raw.data.vv17_3$tonePosX <- NA
raw.data.vv17_3$tonePosY <- NA

json.file.vv17_4 <- "./raw_data/vv17_4.txt"
json.data.vv17_4 <- jsonlite::fromJSON(json.file.vv17_4)
# Put data in a data frame
raw.data.vv17_4 <- json.data.vv17_4$rows$doc
raw.data.vv17_4$name <-"vv17"
raw.data.vv17_4$sessionNumMount <- "5"
raw.data.vv17_4$trainSession <-"4"
raw.data.vv17_4$tonePosX <- NA
raw.data.vv17_4$tonePosY <- NA

raw.data <- rbind(# raw.data.ab22,
                  raw.data.ab21,
                  # raw.data.ap08,
                  raw.data.dd04,
                  raw.data.df22,
                  raw.data.el20,
                  raw.data.gw25,
                  # raw.data.hj12,
                  # raw.data.hp02,
                  # raw.data.jc08,
                  # raw.data.jd12,
                  raw.data.lj01,
                  raw.data.ll07_proc,
                  raw.data.mn15,
                  # raw.data.sa20,
                  # raw.data.shr28,
                  raw.data.ss28,
                  raw.data.va01,
                  raw.data.va01_2,
                  raw.data.df22_2,
                  raw.data.va01_3,
                  raw.data.df22_3,
                  raw.data.va01_4,
                  raw.data.df22_4,
                  raw.data.va01_5,
                  raw.data.df22_5,
                  raw.data.dp02,
                  raw.data.dp02_1,
                  raw.data.dp02_2,
                  raw.data.dp02_3,
                  raw.data.dp02_4,
                  raw.data.kh13_proc,
                  raw.data.kh13_1,
                  raw.data.kh13_2,
                  raw.data.kh13_3,
                  raw.data.kh13_4,
                  raw.data.el17,
                  raw.data.el17_1,
                  raw.data.el17_2,
                  raw.data.el17_3,
                  raw.data.el17_4,
                  # raw.data.ss10_proc,
                  # raw.data.ss10_1,
                  # raw.data.ss10_2_proc,
                  # raw.data.ss10_3,
                  # raw.data.ss10_4,
                  raw.data.vv17,
                  raw.data.vv17_1_proc,
                  raw.data.vv17_2_proc,
                  raw.data.vv17_3,
                  raw.data.vv17_4
                  )

# Change the column names
colnames(raw.data)[1] <- "id"
colnames(raw.data)[2] <- "rev"

# Remove unused rows (metaData and metaDataThresh are used to store data used in the app)
data <- raw.data[!(raw.data$id == "metaData"
                   | raw.data$id == "metaDataThresh"
                   | raw.data$id == "dummy"),]


# Forwarding reversal values to correct bug in the data collect for the subject sa20 and ab22
for (i in 0:length(data$reversal[data$name=="sa20" | data$name=="ab22"])) {
  data$reversal[
    data$name=="sa20" | data$name=="ab22"][i]=data$reversal[
      data$name=="sa20" | data$name=="ab22"][i+1]
}
for (i in 0:length(data$reversal[data$name=="sa20" | data$name=="ab22"])) {
  data$reversals[
    data$name=="sa20" | data$name=="ab22"][i]=data$reversals[
      data$name=="sa20" | data$name=="ab22"][i+1]
}

# Too much trials in the threshold task before training: sessions 0, 1, 2, 3 are before.
# Remove the session 2 and 3 and convert name of sessions 4 and 5 by 2 and 3 respectively
data <- subset(data, !((grepl("threshold2", id)
                        | grepl("threshold3", id))
                       & grepl("shr28", name)))
data$id[data$name=="shr28"] = gsub("threshold4", "threshold2",
                                   data$id[data$name=="shr28"])
data$id[data$name=="shr28"] = gsub("threshold5", "threshold3",
                                   data$id[data$name=="shr28"])
# Also in sessionNum
data$sessionNum[data$name=="shr28"] = gsub("4", "2",
                                           data$sessionNum[data$name=="shr28"])
data$sessionNum[data$name=="shr28"] = gsub("5", "3",
                                           data$sessionNum[data$name=="shr28"])

# No session 0 for ap08 and first session post-test with bug so remove it
data <- subset(data, !(grepl("threshold3", id)
                       & grepl("ap08", name)))

data$id[data$name=="ap08"] = gsub("threshold1", "threshold0",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold2", "threshold1",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold4", "threshold2",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold5", "threshold3",
                                  data$id[data$name=="ap08"])
# Also in sessionNum
data$sessionNum[data$name=="ap08"] = gsub("1", "0",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("2", "1",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("4", "2",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("5", "3",
                                          data$sessionNum[data$name=="ap08"])

# Bad session number for ll07 because of re-start of the app
# in the middle of the experiment (names corrected with couchdb)
data$sessionNum[data$name=="ll07"
                & grepl("threshold2",
                        data$id)] = gsub("0", "2",
                                         data$sessionNum[data$name=="ll07"
                                                         & grepl("threshold2",
                                                                 data$id)])
data$sessionNum[data$name=="ll07"] = gsub("4", "3",
                                          data$sessionNum[data$name=="ll07"])

# Too much session for gw25
data <- subset(data, !((grepl("threshold4", id))
                       & grepl("gw25", name)))

###### Second longitudinal study

## Remove some error trials

# Remove first dataTrials
data <- subset(data, !((grepl("^dataTrial[0-3]$", id))
                       & (grepl("dp02", name)
                          | grepl("kh13", name)
                          | grepl("vv17", name))
                       & sessionNumMount == 1))
data <- subset(data, !((grepl("^dataTrial1[3-7]$", id))
                       & grepl("ss10", name)
                       & sessionNumMount == 4))

# Remove dataTrial40 of dp02_3
data <- subset(data, !((grepl("dataTrial40", id))
                       & grepl("dp02", name)
                       & sessionNumMount == 4))


# Remove thresholds 1_1_27 to 1_1_32 created with error in PouchDB
data <- subset(data, !(data$name=="kh13"
              & (grepl("threshold1_1_2[7-9]", data$id)
                 | grepl("threshold1_1_3[0-2]", data$id))
              & sessionNumMount == 1))


# Correct sessionNum (problem with incrementation)
sessionNum <- function (name, session, sessionNumMount) {
  data$sessionNum[data$name == name
                            & grepl(paste("threshold", session, sep=''),
                                    data$id)
                            & data$sessionNumMount == sessionNumMount] <<- session
}

sessionNum("kh13", 0, 1)
sessionNum("kh13", 1, 1)
sessionNum("kh13", 2, 1)
sessionNum("kh13", 3, 1)

sessionNum("ss10", 2, 1)
sessionNum("ss10", 3, 1)

sessionNum("ss10", 2, 3)
sessionNum("ss10", 3, 3)

sessionNum("vv17", 2, 2)
sessionNum("vv17", 3, 2)
sessionNum("vv17", 2, 3)
sessionNum("vv17", 3, 3)

# Remove unused columns
data$rev <- NULL
row.names(data) <- NULL

# Sort the data according to time
data <- data[order(data$startTrial),]

# Add duration variable in seconds
# Create function to extract the last value of each matrix (= each trial) from the CurXY
extractDur <- function(x) tail(x[,3], n=1)/1000
data$duration <- sapply(data$CurXY, extractDur)

data$duration <- as.numeric(data$duration)

