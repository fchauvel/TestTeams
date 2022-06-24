import { PreventIframe } from "express-msteams-host";

/**
 * Used as place holder for the decorators
 */
@PreventIframe("/axbitTab/index.html")
@PreventIframe("/axbitTab/config.html")
@PreventIframe("/axbitTab/remove.html")
export class AxbitTab {
}
