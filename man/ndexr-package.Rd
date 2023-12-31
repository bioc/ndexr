% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ndex.R
\docType{package}
\name{ndexr-package}
\alias{ndexr-package}
\alias{ndexr}
\title{NDEx R client library}
\description{
The ndexr package offers an interface to NDEx servers, e.g. the public server at http://ndexbio.org/. It can retrieve and save networks via the API. Networks are offered as RCX objects.
}
\details{
\tabular{ll}{
Package: \tab ndexr\cr
Type: \tab Package\cr
Version: \tab 1.19.2\cr
Date: \tab 2016-12-02\cr
License: \tab BSD_3_clause\cr
}
}
\examples{
\dontrun{
require(ndexr)
## login to the NDEx server
ndexcon <- ndex_connect("username", "password")

## search the networks for "EGFR"
networks <- ndex_find_networks(ndexcon, "EGFR")
head(networks, 3)

## UUID of the first search result
networkId <- networks[1,'externalId']
networkId

## get summary of the network
ndex_network_get_summary(ndexcon, networkId)

## get the entire network as RCX object
rcx <- ndex_get_network(ndexcon, networkId)

## show the content (aspects) of the network
rcx$metaData

## visualize the network with RCX
RCX::visualize(rcx)

## upload network as a new network to the NDEx server
networkId <- ndex_create_network(ndexcon, rcx)

## do some other fancy stuff with the network, then
## update the network on the server
networkId <- ndex_update_network(ndexcon, rcx)

## realize, you did bad things to the poor network, so better 
## delete it on the server
ndex_delete_network(ndexcon, networkId)
}
}
\author{
Florian Auer \email{florian.auer@informatik.uni-augsburg.de}

Zaynab Hammoud \email{zaynab.hammoud@informatik.uni-augsburg.de}

Frank Kramer \email{frank.kramer@informatik.uni-augsburg.de}
}
\keyword{package}
