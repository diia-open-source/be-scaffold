import { SessionType } from '@diia-inhouse/types'

export const mapSessionTypeToActionArguments: Record<SessionType, string> = {
    [SessionType.User]: 'UserActionArguments',
    [SessionType.Partner]: 'PartnerActionArguments',
    [SessionType.EResident]: 'EResidentActionArguments',
    [SessionType.Acquirer]: 'AcquirerActionArguments',
    [SessionType.Temporary]: 'TemporaryActionArguments',
    [SessionType.PortalUser]: 'PortalUserActionArguments',
    [SessionType.ServiceUser]: 'ServiceUserActionArguments',
    [SessionType.EResidentApplicant]: 'UserActionArguments',
    [SessionType.ServiceEntrance]: 'UserActionArguments',
    [SessionType.CabinetUser]: 'UserActionArguments',
    [SessionType.None]: 'ServiceActionArguments',
}
