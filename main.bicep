param location string = 'centralus'
module firewall_policies 'modules/firewall_policies.bicep' = {
  name: 'appService'
  params: {
    location: location
  }
}
