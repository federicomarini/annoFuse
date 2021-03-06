##' Function to identify fusions called by at least n callers

#' @param standardFusioncalls A dataframe from star fusion or arriba standardized to run through the filtering steps
#' @param group column name in input standard fusion calls that should be used to identify subset the sample belongs to in the cohort
#' @param numGroup Least number of groups that have the fusion to categories as false call in cohort
#'
#' @export
#'
#' @return Fusions found in more than n groups in cohort
#'
#' @examples
#' # TODOTODO
groupcount_fusion_calls <- function(standardFusioncalls = standardFusioncalls,
                                    group = group,
                                    numGroup = numGroup) {

  # remove fusions that are in > numGroup
  group.count <- standardFusioncalls %>%
    dplyr::select(.data$FusionName, !!as.name(group)) %>%
    unique() %>%
    group_by(.data$FusionName) %>%
    dplyr::mutate(group.ct = n(), Sample = toString(!!(as.name(group)))) %>%
    dplyr::filter(.data$group.ct > numGroup)

  return(group.count)
}
