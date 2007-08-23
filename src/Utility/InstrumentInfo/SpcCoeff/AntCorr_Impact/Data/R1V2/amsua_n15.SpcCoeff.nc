CDF       
      
n_Channels        n_FOVs              write_module_history      M$Id: SpcCoeff_netCDF_IO.f90 741 2007-07-13 13:40:58Z paul.vandelst@noaa.gov $      creation_date_and_time        2007/07/16, 12:49:55 -0400UTC      Release             Version             	Sensor_Id         	amsua_n15      WMO_Satellite_Id         �   WMO_Sensor_Id           :   
AC_Release              
AC_Version              title         $Spectral coefficients for amsua_n15.   history      $Id: Create_MW_SpcCoeff.f90 749 2007-07-16 15:32:07Z paul.vandelst@noaa.gov $; MW_SensorData: $Id: MW_SensorData_Define.f90 738 2007-07-11 21:20:12Z paul.vandelst@noaa.gov $; AntCorr: $Id: AAPP_AMSU_AntCorr_ASC2NC.f90 727 2007-07-05 18:08:09Z paul.vandelst@noaa.gov $    comment      lBoxcar spectral response assumed; CMB value from J.C. Mather, et. al., 1999, "Calibrator Design for the COBE Far-Infrared Absolute Spectrophotometer (FIRAS)," Astrophysical Journal, vol 512, pp 511-520; AntCorr: AAPP v6 fdf data; Reference: T. Mo, (1999), "AMSU-A Antenna Pattern Corrections", IEEE Transactions on Geoscience and Remote Sensing, Vol.37, pp.103-112         Sensor_Type              	long_name         Sensor Type    description       <Sensor type to identify uW, IR, VIS, UV, etc sensor channels   units         N/A    
_FillValue                    �   Sensor_Channel                  	long_name         Sensor Channel     description       List of sensor channel numbers     units         N/A    
_FillValue                  <  �   Polarization                	long_name         Polarization type flag     description       Polarization type flag.    units         N/A    
_FillValue                  <  �   Channel_Flag                	long_name         Channel flag   description       Bit position flags for channels    units         N/A    
_FillValue                  <  ,   	Frequency                   	long_name         	Frequency      description       Channel central frequency, f   units         Gigahertz (GHz)    
_FillValue        ��            x  h   
Wavenumber                  	long_name         
Wavenumber     description       Channel central wavenumber, v      units         Inverse centimetres (cm^-1)    
_FillValue        ��            x  �   	Planck_C1                   	long_name         	Planck C1      description        First Planck coefficient, c1.v^3   units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            x  X   	Planck_C2                   	long_name         	Planck C2      description       Second Planck coefficient, c2.v    units         
Kelvin (K)     
_FillValue        ��            x  �   Band_C1                 	long_name         Band C1    description       $Polychromatic band correction offset   units         
Kelvin (K)     
_FillValue        ��            x  H   Band_C2                 	long_name         Band C2    description       #Polychromatic band correction slope    units         K/K    
_FillValue        ��            x  �   Cosmic_Background_Radiance                  	long_name         Cosmic Background Radiance     description       5Planck radiance for the cosmic background temperature      units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            x  8   Solar_Irradiance                	long_name         Kurucz Solar Irradiance    description       *TOA solar irradiance using Kurucz spectrum     units         mW/(m^2.cm^-1)     
_FillValue        ��            x  �   A_earth                    	long_name         A(earth)   description       !Antenna efficiency for earth view      units         N/A    
_FillValue        ?�             (   A_space                    	long_name         A(space)   description       &Antenna efficiency for cold space view     units         N/A    
_FillValue                       #8   
A_platform                     	long_name         A(platform)    description       .Antenna efficiency for satellite platform view     units         N/A    
_FillValue                       1H                              	   
                  	   	   	   	   
   
   	   
   
   
   
   
   
   
   	                                                           @7��^�@?f��Ԫ@I&csl�&@JfRiY_�@J�6e�@K3#̍�@Kxf�:��@K��f�A�@L�)�,
J@L�)�,
J@L�)�,
J@L�)�,
J@L�)�,
J@L�)�,
J@V?���+?�g�@�d�?��,�r?��^e�6?�-�n��?���5���?�}��c�?�Rk��l?���>�?��teYB�?��teYB�?��teYB�?��teYB�?��teYB�?��teYB�@��
o2>���<J�>쳈&o��?~����?{�` h?���7%r?���Ŏ�?7�[���?���*�?�"�tr�?�"�tr�?�"�tr�?�"�tr�?�"�tr�?�"�tr�?4k��O ?�F���~?���K�@O�G�@E��>@��o4�@�׏���@��w@N���@��X�x�@��X�x�@��X�x�@��X�x�@��X�x�@��X�x�@���N:���0�   ��~�,   �Ѷ�   ����   ����>   ����   ���y�   ����   ���}�   �4��   �!Ttr   �!o��  � ��0   � ��ǀ  �LH̘  ?� �Z�?� *���?� ;x�_?� 9	��?� ��??� �iZ�?� �EIL?� =��?� 
�ҹ?� C��P?� !����?� !b�r~?� !6�~�?� !.:�?� �&p�>������>�o^����?�B8�?<��(�y?���he5?9�?)��?�;$�MP?�iFp-�?	[�v?	[�v?	[�v?	[�v?	[�v?	[�v?�z�3��                                                                                                                        ?�D4�6�?����?�΁�?ﭶ�_�?ﳳ S\�?�\�_=}?���)�?�zԲt\?���>�P?�����?�����^?��j�?��1��d?��g�?[`?��Lnm��?���(kY?��(V`^�?��E�w?���
���?��@Jr��?��r�K8?����g?��rKv��?������?���]�H?�ŬGH?�qO?���'��?���)�?����a?��YO&��?��7O�e�?���Y��2?�����s�?�ِ)�O3?��r\=�x?���z9�?������?������?�㸡��Z?���0�?���?��IU�g{?��Kn�[�?��X��<?�䒼/Ɨ?����,?�������?��˧2�P?��b�f�	?��덂4"?�ݚ
^�?���c�	?��6mzV�?��D���?��x�wN�?��%,�2�?��g��C?���z�?����>}?� ���?p*4�?�?�H!�v?���%=�?�@��>?凌����?����q?�;B�-k?�]_V�?�k~�v?��x���?�ayW?�&$V�^?�X����?閭��-�?泌��\?�g�U:�?�"�Wq ?�x��5�?_��I?���"?�qO?�T\�X?�3H+�?�Yėt%?��S�?��F��t?�{�!�gQ?�v/����?��'�(�?�{cM�2?�o��s?�pXW��?���O�QD?������?��!��{$?���Pv?�؜䧴�?���x�?��N�Y�?�ݦ�D�?��i�B��?��T�͍�?��q����?��;dZ�?�ޞ�?��5?|�?��~˷��?�ܵxqP?��)�<�?��)g��?���+�&�?��0H�'�?�������?��p���a?��P���l?�k���?�U���?�6��=�?�����?��Na��?���v�?︀��?��o�X�D?�̱�zg�?���@?��RG�p�?�һ#W?��8��Rr?���r��I?�Ԍ����?��:���5?�����?�՝U�b?��Is��?��b�C�?��R"Ã?��RG�p�?��V�I?��i��G�?��3C�*�?�͉�.��?�˚����?��#���k?��'�!W?�&Rz X?�6TO�m?�xF�?:э&?���v�?���J�TT?��.3�?��~�T~?�׾�V�{?�ޏl��c?��ެ�!G?��9��?�����b?�����?���k��?��KY��?��Pֲ(�?�����{?���lT��?��Ԫ�"?����?�����?���P��?��=�\9�?��R��o�?��h�R�?���_���?��әo�/?�ᰉ�'R?�٣	�� ?���/�?���%,�3?�Ą�N��?�J�)�?��$�h?�m�r��?ﭫ�U�=?ﴞ�&�?��G��?��b� �?��Ĵ�V�?���(�&?�� �S��?���4�?�՝U�b?��f��?��b,Ei?���p C?����2�?�ټ3�U?��L�2?���?�ג���?�ԥ�"9�?����Я?��+Q�a�?��
Z��0?��z��?���?��gw�?��7�?Qھ'?�W�?��3?��qT 2?�yg��t?�ù'�Z?ﮌ���?��Z�N�?�� ��;?���P��J?����e�?�ţ�w)?���VI?��S�^?��Mv�X?��4L7��?���&^B?����)��?��ɣL��?�ŕ5�ʊ?�Ž�:?�Ŋ�,?��h�R?�È��lU?�����+?���n��?�7���?Ｋ��i�?�e��x?﫾ʫ�]?�)Es��?�Y�U?e�.�?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?��-°�?���#g�?�Ѭ���?��%�BcR?��-r���?��]=ȸk?����: ?���~�*?��<�:\?�� ͅY?���	�1�?��D��?���4?���Z��?���!ȧ�?��H����?����r��?����?��t����?����ߏG?��]Е�?��<t�T�?��)��l�?��6���?��P7O�f?�ܢ�E܃?��ѝ��q?��u/?��X%[?������?������?����u�h?�ۘA��;?��x̚w�?����|�?��C핚1?��"9櫛?��C���?��72�4?������?����Ft?�����υ?��R��F�?����;?�ݕ�Lv�?�݅T�?���
�v�?���<}^�?�� F�d�?��;���?�� F�d�?���n;F�?���|�57?�݉H�I?��g�M�?��t�?����6?���7�a�?���u��?���ܠ?����?��f�?�q�#[N�?}\1Y>_�?{T\�W�?z�$�'�)?y��ʁ��?x#B$g�U?v���eV?vZH�`�?uK���5?t�y��]�?s�x�?r��U�?q�37d�?q<hf�?p��,ӝ�?q�m&t?s8��Rq�?tǎ�j�?u
���*=?v���v�?y�G�F8�?~3&��z�?�E�QeMb?�sO��f?�5��7&?�Q*�� &?��i+<Ĭ?�|c'��?q`4Pi�?pbM���?m��G�M�?k%�3�c�?j&�{�??h$ p��?f�#��-#?dʒ_�t�?c�CII?c3�j�8�?b�ma,?b��J�ͯ?b�kaw�?b�̫֔??bt�*,#t?b]Е�)N?b��s���?c]9���?d����?eT���Q�?f�C� `x?hc8�|s�?j���K�?n}��ҡ�?p�+�H�?q�:���?rݽ�ؔ�?t$咖p?u;�gf@�?u�s�g�?�1��F�B?}�R\�&5?{qu�!�S?y:-�7��?v hUS�k?tZ_���?s����
�?s)=+�.?r�m��a�?rJ�\�?r}E��~k?r|96�s?q�qd�)�?qYėt%l?qK~ǆ<?q�Ǘ�d?r �T��?r�zcsl�?sb�d8�?s�V�:q?tK��:�?t�j쑎?uJ�?vك�u?x�b��T?z��?}}�H˒?�C�2`=?�PT�)�?���O/<?�%Vѝ��?~�)4��?{ⴕ�bV?w]�MYO?r�C��P�?m��G�M�?j�����?iGϢj"�?g�����?fR�<64?d�D�~or?b�kaw�?b)b����?a<hf�?a,^,�?a1�VuX?a��Ty��?b3�*�b|?b�pm�P?c	���r?dP�ܜM�?f�]�9~?h�Z)AB?iz$�LD|?l��D��?q�����?v=Ć�-�?y� >c��?|�7ɚ�%?��<��D?����b�?�2���?|�I^�L?x�f'|E�?s��u�=?o��D��V?k��S���?j��+�X�?k]9��?k����?j�:э%�?i�Cg]�+?iL`RP/?iL`RP/?h��a�E?h���dsG?iǼ��?j�,<���?k�XdE#�?l�zA�}�?m%��ts?m�����?n�<��?p+�.'Z�?q�:���?uM�΁�?yX��
ء?}6q��a?�K<>t��?�N�EE�o?zmi��q?v���A�S?t��`Z��?q�x�>F�?l���ͫ?fc�3��"?c�%�l��?b���U��?ar�
�6P?`��=y?_��m�Ǥ?^:}�O�C?[�����?Z��!�?XzJH�n?Vn ��8�?UHf��?Ui��`4�?V�"���?XX�Y�:?Z2�-4�?\�H��P"?`}�%Vў?b}E��~k?fc�3��"?n0O�X�?s6޹^Z�?v6mzV�3?xl����E?{r�����?�6X��UP?��VuW�?�����_�?~Ft�GV?y�ա���?v'�a�??t�1	�G|?s��'��O?rY�����?q
8�C?o]���#B?m�����?l�+Z ��?kZc���,?kd�Ti�?kmC�9h�?j�m�+?k4�L{�?m�w�2HR?pW�x-8G?r;66�?t����L?v��;��-?x?��F�V?zUK���?~�w9�@�?� # �x?�GyB=?��L�2?��z��|�?�A��}�?9K{(�J?{ނ׶4�?xPX��D?s܋��_�?paAcw��?l��Q���?khD���?j��-��?i`��3�?h�n�?g�as�^�?go��%�?g��[�Q?h�9X ?i���4@?igD��w�?iA���z?i|=h@[:?j��"N�?kXK��n?l�(Z��?mS��n�?m賳 S]?o����P?r��JU��?wթ� t�?|���Y}J?���4v)?�����v?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?r�2�%�?p�ܜM� ?n�u?l0L���?g�����?eu6G?c��҈�?a�_�J/�?`���-
$?_�OT��l?^����h�?]6q��a?\*2	g�?Z��W�U?Z�
|[?W&�2�
?VD#�r?V�#��-#?W)���?X7.jv�_?Z \FQ��?[�_��@�?]Ѣ�Y6?`�B=�1�?c�CII?g?����?l���P��?pI#_��?r+��Ԅ?t�ЍK�}?d�'���?dp�I�?b-���C?a�u����?_pޏl��?]�����d?\��IbI�?\�ݽ�ؕ?\}�,�,?\y�JDǰ?\tB���?\2e���?\�r�na?]�2��?]:�i���?]%��ts?\�{�?\u��\�5?\6�k���?\	|��?\}�,�,?\�]	A?]O���E?]��O���?_�ТDc?aM/]���?c�T��CF?d�VW�i�?gewS�F?iRK�.�h?n� -��=?l�ߤ?�?im�O��
?g���#��?e�����?c��r�v?a�X��8?`>��'c?^:}�O�C?\u��\�5?Z��,Q��?Z��"N�?Y�G�F8�?Ym�O��
?Y~VG4q�?X��XՄ+?W����.?W�(kYn?Wr��<�?WLL߬�b?W��x?X�9X ?XzJH�n?YGϢj"�?Z����?\�+Z ��?`�0�7�?b�a�V!?d��g��?h	A|�?_��#x�?^Z�U��?\K�!J�c?Z&�{�??X�t�j~�?W�CA�0?T��Ѣ?SQ�IwB?R�zcsl�?R'I���
?Q�X��8?Q�K<>t�?Q���n�?Q��m��?Q�X��8?R�u?R��D$?R'I���
?RH��&E�?R�W:yx�?S]9���?Tp�I�?U��Ty�?V������?Y\�W�?[y�	��J?^>�h7��?`��NP��?b���IӉ?d��`Z��?{�sh�h�?{qu�!�S?{H�����?{!�u�6*?z}$<�?z�s�,�?y�G�F8�?ys��p C?y����2?y�`�:O�?y������?z��?zP^�T?z�)=+�?{�u%F?{!�u�6*?{
��i<?{	�q�0�?{�P�Gc?{,@Ъ��?{k*�ER?{mC�9h�?{�x��WK?|=�x?�?|�i���?}E��e�?~���%�?~��>[�b?nŰx�0?�c�b?fx|�_��?dʒ_�t�?b���C��?a���c$?`�)^�	?`1�n�F?_����P?_>����%?_B�fr��?_6&,�s.?^�ؐOm�?^�J�!?^ծ�]?^����?_�E�Qe?_%_5�@?_�E�Qe?_-°�7?_Ո]13?`@��>!?`���',�?`�����?`�3����?aU�ً��?b�u?b��t2?c3�j�8�?c����e?d���;u?f�#��-#?ikvp��L?heQ�p��?g�dM�r?f%���?d�.��?cʸ��=?c��gUz?b����+?b1�K�K�?a�u����?a}ke��?au��M?a{R���G?a�|�&�+?aٱ����?a��
�A?a���c$?a�ʖ��]?a�_�J/�?b�u?bp�lC��?c� �[S?c�Q�7�M?d��u�?e��Ty�?f��}ܤ�?h(�Q��/?i\�W�?jǗ�dN?lT\�X?`>��'c?]�T�8T?[Ɋ"-Qr?Y\�W�?WewS�F?V�w�2?TDZ���7?R�H��?d?Q���ϧ?P�bf�e?P���I�?O��D��V?O��D��V?O�:��.M?Oٺ`�?O�V�I?OS�^��?O�~�?N��>[�b?NW�۩�?NOv_ح�?N��F��t?N`=Wyc�?N���mL4?O�Ȱ�(?PY�W!O?Q�|�&�+?S����!}?UD4�6��?W�/��1?d"̳�Y\?a�3m�?`)�O3C�?]��qy��?Z���9�?X��8:��?X�9X ?WC�c�Hk?V������?V3H+�?V%���?U�ް��/?U�P��sT?UrX0��?U�����?U�n��?U��E�?Uz�� ��?Ui��`4�?UT���Q�?U]_V���?U�P��sT?U�IwBV�?V�<�P<?Vz��S�H?W7T*#��?Z�w�2H?^�`�sW�?b8\g��?d�9.�<?r
�/�	?q��;�?p���_��?pi��G��?p+�.'Z�?p)�O3C�?pj��X?o���w�?o��f�;?o�Ȱ�(?o��e�}�?p���a?p-�qv?pR�J��m?p�2Ήeo?p���6�?p���>�?p��s��?p|����??pzk�证?p�d�q��?p��V>��?q���6�?qoɼw4?q���ڲ?r }�A5T?rJ�\�?r���L�P?s[����?s�ɴ�c?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?`�l�B�?`I#_��?^���Ɗ�?]S��n�?[�I�V��?[�u%F?Y����?XL'�y�?X"5����?W�}R;67?W�as�^�?W�B_ !?W�/��1?WֶZ��I?X*�0��?XCä/�?X��{?X�{5*�?W�v��?W��j�@?W�����?WֶZ��I?W�����?W�DI��%?X	A|�?X7.jv�_?X�4i�P?Y�c���?[����7?\�U͑�?cfQ�Z�?c:�}?b:)�y��?bݽ�ؔ�?b�� �� ?b�:�6?b]Е�)N?br�K8�?b��ߵ�?b��+�Q?b��JU��?c%RC��?c]����?c�j�+�?c������?c�P�ܜ?c�m��Z?c��r�v?c�m��Z?c��'��O?c�ƴ��k?c�c8�|t?c��AƆ?c8�Ck�?d>�`�?c�[�=_�?d&�q���?cp����`?d�o6�V?d��&0�1