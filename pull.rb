require 'savon'

client = Savon.client(wsdl: "http://localhost:40001/console/services/soap/Job.wsdl")

remote_path = ARGV[0]

#response = client.call(:authenticate, message: { username: "luke", password: "secret" })

response = client.call( :submit) do
  message( { type: "Aspera.IScpTransfer", definition: "

  <Order>
   <Version>2</Version>
   <Agent>TestJob</Agent>
   <ApplicationData>
      <Cookie>0b4d88f5-4f87-44dd-ae7d-c4362dc9ef19</Cookie>
   </ApplicationData>

   <Operation>Pull</Operation>
   <RemoteLocation>
      <System>

         <Address>hack2.aspera.us</Address>

         <Port>22</Port>
         <UserName>song</UserName>
         <Password>@abc123</Password>
      </System>
      <Authentication>
         <Methods>
            <Method>Password</Method>
         </Methods>
      </Authentication>
      <Files>
         <Path>#{remote_path}</Path>
      </Files>
      <RootPath>/</RootPath>
   </RemoteLocation>
   <LocalLocation>
      <System />
      <Files>
         <Path>./Users/Fong/zoosh/</Path>
      </Files>
      <RootPath>/</RootPath>
   </LocalLocation>
   <FileParameters>
      <CreatePath>Yes</CreatePath>
      <ResumeCheck>None</ResumeCheck>
      <PreCalculateJobSize>Yes</PreCalculateJobSize>
      <RemoveAfterTransfer>No</RemoveAfterTransfer>
      <PreserveTimestamps>Yes</PreserveTimestamps>
      <Overwrite>Diff</Overwrite>
   </FileParameters>
   <LinkParameters>
      <RemoteCapacity>2000000</RemoteCapacity>
      <LocalCapacity>2000000</LocalCapacity>
      <AutoDetectCapacity>Yes</AutoDetectCapacity>
   </LinkParameters>
   <RateParameters>
      <Policy>Fair</Policy>
      <TargetRate>10000</TargetRate>
      <TargetRateAsPercent>No</TargetRateAsPercent>
      <MinimumRate>500</MinimumRate>
      <MinimumRateAsPercent>No</MinimumRateAsPercent>
      <BandwidthCap>10000</BandwidthCap>
   </RateParameters>
   <SecurityParameters>
      <EncryptionCipher>None</EncryptionCipher>
   </SecurityParameters>
   <RetryParameters>
      <Count>3</Count>
      <BaseInterval>5</BaseInterval>
      <MaximumInterval>10</MaximumInterval>
   </RetryParameters>
   <ChannelParameters>
      <Port>33001</Port>
      <DatagramSize>1492</DatagramSize>
      <AutoDetectPathMTU>Yes</AutoDetectPathMTU>
   </ChannelParameters>
</Order>

                       " })

end

p response.hash
p response.success?

