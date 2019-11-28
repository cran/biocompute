## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(comment = "")

## -----------------------------------------------------------------------------
library("biocompute")

## -----------------------------------------------------------------------------
biocompute::versions()

## -----------------------------------------------------------------------------
name <- "HCV1a ledipasvir resistance SNP detection"
version <- "1.0.0"
review <- data.frame(
  "status" = c("approved", "approved"),
  "reviewer_comment" = c(
    "Approved by [company name] staff. Waiting for approval from FDA Reviewer",
    "The revised BCO looks fine"
  ),
  "date" = c(
    as.POSIXct("2017-11-12T12:30:48", format = "%Y-%m-%dT%H:%M:%S", tz = "EST"),
    as.POSIXct("2017-12-12T12:30:48", format = "%Y-%m-%dT%H:%M:%S", tz = "America/Los_Angeles")
  ),
  "reviewer_name" = c("Jane Doe", "John Doe"),
  "reviewer_affiliation" = c("Seven Bridges Genomics", "U.S. Food and Drug Administration"),
  "reviewer_email" = c("example@sevenbridges.com", "example@fda.gov"),
  "reviewer_contribution" = c("curatedBy", "curatedBy"),
  "reviewer_orcid" = c("https://orcid.org/0000-0000-0000-0000", NA),
  stringsAsFactors = FALSE
)

derived_from <- "https://github.com/biocompute-objects/BCO_Specification/blob/1.2.1-beta/HCV1a.json"
obsolete_after <- as.POSIXct("2018-11-12T12:30:48", format = "%Y-%m-%dT%H:%M:%S", tz = "EST")

embargo <- c(
  "start_time" = as.POSIXct("2017-10-12T12:30:48", format = "%Y-%m-%dT%H:%M:%S", tz = "EST"),
  "end_time" = as.POSIXct("2017-11-12T12:30:48", format = "%Y-%m-%dT%H:%M:%S", tz = "EST")
)

created <- as.POSIXct("2017-01-20T09:40:17", format = "%Y-%m-%dT%H:%M:%S", tz = "EST")

modified <- as.POSIXct("2019-05-10T09:40:17", format = "%Y-%m-%dT%H:%M:%S", tz = "EST")

contributors <- data.frame(
  "name" = c("Jane Doe", "John Doe"),
  "affiliation" = c("Seven Bridges Genomics", "U.S. Food and Drug Administration"),
  "email" = c("example@sevenbridges.com", "example@fda.gov"),
  "contribution" = I(list(c("createdBy", "curatedBy"), c("authoredBy"))),
  "orcid" = c("https://orcid.org/0000-0000-0000-0000", NA),
  stringsAsFactors = FALSE
)

license <- "https://creativecommons.org/licenses/by/4.0/"

compose_provenance(
  name, version, review, derived_from, obsolete_after,
  embargo, created, modified, contributors, license
) %>% convert_json()

## -----------------------------------------------------------------------------
tlf <- compose_tlf(
  compose_provenance(), compose_usability(), compose_extension(),
  compose_description(), compose_execution(), compose_parametric(),
  compose_io(), compose_error()
)
biocompute::compose(
  tlf,
  compose_provenance(), compose_usability(), compose_extension(),
  compose_description(), compose_execution(), compose_parametric(),
  compose_io(), compose_error()
) %>% convert_json()

## -----------------------------------------------------------------------------
bco <- tempfile(fileext = ".json")
generate_example("HCV1a") %>%
  convert_json() %>%
  export_json(bco)
bco %>% validate_checksum()

## -----------------------------------------------------------------------------
bco <- tempfile(fileext = ".json")
generate_example("HCV1a") %>%
  convert_json() %>%
  export_json(bco)
bco %>% validate_schema()

