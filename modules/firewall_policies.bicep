param location string
param firewallPolicies_fw_policy_01_name string = 'fw-policy-01'

resource firewallPolicies_fw_policy_01_name_resource 'Microsoft.Network/firewallPolicies@2020-11-01' = {
  name: firewallPolicies_fw_policy_01_name
  location: location
  properties: {
    sku: {
      tier: 'Premium'
    }
    threatIntelMode: 'Alert'
    threatIntelWhitelist: {
      fqdns: []
      ipAddresses: []
    }
    intrusionDetection: {
      mode: 'Off'
    }
  }
}

resource firewallPolicies_fw_policy_01_name_DefaultNetworkRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2020-11-01' = {
  parent: firewallPolicies_fw_policy_01_name_resource
  name: 'DefaultNetworkRuleCollectionGroup'
  //location: location
  properties: {
    priority: 200
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule1'
            ipProtocols: [
              'Any'
            ]
            sourceAddresses: [
              '10.0.0.26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.0.0.132'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '80'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'Test1'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.30'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              'AppService'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '8123'
            ]
          }
        ]
        name: 'fw-policy-01-network-rules-01'
        priority: 100
      }
    ]
  }
}
