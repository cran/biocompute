% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compose-provenance.R
\name{compose_provenance_v1.4.2}
\alias{compose_provenance_v1.4.2}
\alias{compose_provenance}
\title{Compose BioCompute Object - Provenance Domain (v1.4.2)}
\usage{
compose_provenance_v1.4.2(
  name = NULL,
  version = NULL,
  review = NULL,
  derived_from = NULL,
  obsolete_after = NULL,
  embargo = NULL,
  created = NULL,
  modified = NULL,
  contributors = NULL,
  license = NULL
)

compose_provenance(
  name = NULL,
  version = NULL,
  review = NULL,
  derived_from = NULL,
  obsolete_after = NULL,
  embargo = NULL,
  created = NULL,
  modified = NULL,
  contributors = NULL,
  license = NULL
)
}
\arguments{
\item{name}{Character string. Name for the BCO.}

\item{version}{Character string. Version of this BCO instance object.
Should follow the Semantic Versioning format (MAJOR.MINOR.PATCH).}

\item{review}{Data frame. Reviewer identifiers and descriptions
of the status of an object in the review process.}

\item{derived_from}{Character string. Inheritance/derivation description.}

\item{obsolete_after}{Date-time object. Expiration date of the object (optional).}

\item{embargo}{Vector of date-time objects \code{start_time} and \code{end_time}.
If the object has a period of time that it is not public,
that range can be specified with this.}

\item{created}{Date-time object. Initial creation time of the object.}

\item{modified}{Date-time object. The most recent modification time of the object.}

\item{contributors}{Data frame. Contributor identifiers and descriptions
of their contribution types.}

\item{license}{Character string. Licence URL or other licence information (text).}
}
\value{
A list of class \code{bco.domain}
}
\description{
Compose BioCompute Object - Provenance Domain (v1.4.2)
}
\examples{
name <- "HCV1a ledipasvir resistance SNP detection"
version <- "1.0.0"
review <- data.frame(
  "status" = c("approved", "approved"),
  "reviewer_comment" = c(
    "Approved by [company name] staff. Waiting for approval from FDA Reviewer",
    "The revised BCO looks fine"
  ),
  "date" = c(
    as.POSIXct("2017-11-12T12:30:48", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST"),
    as.POSIXct("2017-12-12T12:30:48", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "America/Los_Angeles")
  ),
  "reviewer_name" = c("Jane Doe", "John Doe"),
  "reviewer_affiliation" = c("Seven Bridges Genomics", "U.S. Food and Drug Administration"),
  "reviewer_email" = c("example@sevenbridges.com", "example@fda.gov"),
  "reviewer_contribution" = c("curatedBy", "curatedBy"),
  "reviewer_orcid" = c("https://orcid.org/0000-0000-0000-0000", NA),
  stringsAsFactors = FALSE
)

derived_from <- "https://github.com/biocompute-objects/BCO_Specification/blob/1.2.1-beta/HCV1a.json"
obsolete_after <- as.POSIXct("2018-11-12T12:30:48", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST")

embargo <- c(
  "start_time" = as.POSIXct("2017-10-12T12:30:48", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST"),
  "end_time" = as.POSIXct("2017-11-12T12:30:48", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST")
)

created <- as.POSIXct("2017-01-20T09:40:17", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST")

modified <- as.POSIXct("2019-05-10T09:40:17", format = "\%Y-\%m-\%dT\%H:\%M:\%S", tz = "EST")

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
) \%>\% convert_json()
}
