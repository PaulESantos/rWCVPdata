#' Startup hook
#' @noRd
.onAttach <- function(...) {
    if (is_loading_for_tests()) {
        return(invisible())
    }

    attached <- rwc_attach()
    inform_startup(rwc_attach_message(attached))
}

is_attached <- function(x) {
    paste0("package:", x) %in% search()
}

is_loading_for_tests <- function() {
    !interactive() && identical(Sys.getenv("DEVTOOLS_LOAD"), "rWCVPdata")
}

inform_startup <- function(msg) {
    if (is.null(msg)) {
        return()
    }
    if (is_attached("conflicted")) {
        return()
    }
    packageStartupMessage(msg)
}
