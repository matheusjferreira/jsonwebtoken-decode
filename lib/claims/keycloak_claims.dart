import 'claims.dart';

class KeyCloakClaims extends Claims {
  KeyCloakClaims(super.payload);

  List get rolesRealmAccess {
    final realmAccess = part.claim('realm_access');
    return realmAccess['roles'];
  }

  List get rolesAccount {
    final resourceAccess = part.claim('resource_access');
    final account = resourceAccess['account'];
    return account['roles'];
  }

  String get typ => part.claim("typ");
}
