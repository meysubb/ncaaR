#' Team Schedule and Results
#'
#' Returns a dataframe of the team's schedule and results.
#' Additional information includes: (1) site and (2) cumulative record
#' @param team_id Team ID from team_mapping
#' @param sport Tradiational Sport Name or Sport Code
#' @param year Actual Year (example: 2016 or 2015)
#' @importFrom magrittr "%>%"
#' @importFrom xml2 "read_html"
#' @importFrom dplyr "select"
#' @importFrom dplyr "everything"
#' @importFrom rvest "html_table"
#' @importFrom rvest "html_nodes"
#' @importFrom rvest "html_text"
#' @importFrom stringr "str_sub"
#' @keywords Team Season Stats
#' @export
#' @examples
#' team_schedule(697,2016,"MBB")
#'
#' team_schedule(697,2015,"Womens Soccer")
#'

team_schedule <- function(team_id,year,sport){
  year_id <- year_ref(year,sport)
  all_team_names <- team_mapping(year,sport)
  team_name <- all_team_names[which(all_team_names$team_id == team_id),2]
  url <- paste0("http://stats.ncaa.org/player/game_by_game?game_sport_year_ctl_id=",year_id,"&org_id=",team_id,"&stats_player_seq=-100")
  basic <- read_html(url) %>% html_nodes(".smtext") %>% html_text()
  basic <- gsub("[\r\n]", "", basic)
  basic <- trimws(basic)
  basic_df <- as.data.frame(t(matrix(basic,nrow=3)),stringsAsFactors = FALSE)
  colnames(basic_df) <- c("Date","Opponent","Score")
  ### Replace above lines with extract_base_schedule
  basic_df$site <- ifelse(startsWith(basic_df$Opponent,"@"),"Away","Home")
  basic_df$site[grep("@",str_sub(basic_df$Opponent, 2, -2))] <- "Neutral"
  basic_df$team <- team_name
  basic_df$result <- substr(basic_df$Score,1,1)
  basic_df$OT <- gsub("(?<=\\()[^()]*(?=\\))(*SKIP)(*F)|.", "", basic_df$Score, perl=T)
  basic_df$OT <- ifelse(basic_df$OT == "",NA,basic_df$OT)
  basic_df$Score <- gsub("\\([^()]*\\)", "", str_sub(basic_df$Score,3,-1))
  basic_df$team_score <- as.numeric(trimws(sub("-.*", "", basic_df$Score)))
  basic_df$opp_score <- as.numeric(trimws(sub(".*-", "", basic_df$Score)))
  basic_df$win <- cumsum(ifelse(basic_df$result == "W",1,0))
  basic_df$loss <- cumsum(ifelse(basic_df$result == "L",1,0))
  basic_df <- basic_df %>% select(team,Date,Opponent,site,OT,result,Score,everything())
  return(basic_df)
}
