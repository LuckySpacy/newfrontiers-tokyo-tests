unit Types.Mail;

interface

const
  c_UstTLSMax = 3;
  c_UseTLS:array [0 .. c_UstTLSMax] of record
          ID: byte;
          Text: string;
          end = ((ID: 0; Text: 'NoTLSSupport'),
                 (ID: 1; Text: 'UseImplicitTLS'),
                 (ID: 2; Text: 'UseRequireTLS'),
                 (ID: 3; Text: 'UseExplicitTLS'));

  c_AuthTypeMax = 2;
  c_AuthType:array [0 .. c_AuthTypeMax] of record
          ID: byte;
          Text: string;
          end = ((ID: 0; Text: 'Kein'),
                 (ID: 1; Text: 'Default'),
                 (ID: 2; Text: 'SASL'));

  c_SSLVersionMax = 5;
  c_SSLVersion:array [0 .. c_SSLVersionMax] of record
          ID: byte;
          Text: string;
          end = ((ID: 0; Text: 'sslvSSLv2'),
                 (ID: 1; Text: 'sslvSSLv23'),
                 (ID: 2; Text: 'sslvSSLv3'),
                 (ID: 3; Text: 'sslvTLSv1'),
                 (ID: 4; Text: 'sslvTLSv1_1'),
                 (ID: 5; Text: 'sslvTLSv1_2'));

implementation

end.
