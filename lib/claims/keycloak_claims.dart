import './payload_claims.dart';

class KeycloakClaims extends PayloadClaims {
  KeycloakClaims(super.jwtBuilder);

  List get rolesRealmAccess {
    final realmAccess = claim('realm_access');
    return realmAccess['roles'];
  }

  List get rolesAccount {
    final resourceAccess = claim('resource_access');
    final account = resourceAccess['account'];
    return account['roles'];
  }

  get typ => claim("typ");
}
