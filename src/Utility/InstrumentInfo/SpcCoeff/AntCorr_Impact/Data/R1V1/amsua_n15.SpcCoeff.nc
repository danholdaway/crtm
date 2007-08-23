CDF       
      
n_Channels        n_FOVs              write_module_history      M$Id: SpcCoeff_netCDF_IO.f90 741 2007-07-13 13:40:58Z paul.vandelst@noaa.gov $      creation_date_and_time        2007/07/16, 12:46:52 -0400UTC      Release             Version             	Sensor_Id         	amsua_n15      WMO_Satellite_Id         �   WMO_Sensor_Id           :   
AC_Release              
AC_Version              title         $Spectral coefficients for amsua_n15.   history      $Id: Create_MW_SpcCoeff.f90 749 2007-07-16 15:32:07Z paul.vandelst@noaa.gov $; MW_SensorData: $Id: MW_SensorData_Define.f90 738 2007-07-11 21:20:12Z paul.vandelst@noaa.gov $; AntCorr: $Id: NESDIS_AMSUA_AntCorr_ASC2NC.f90 708 2007-06-28 21:39:24Z paul.vandelst@noaa.gov $     comment      �Boxcar spectral response assumed; CMB value from J.C. Mather, et. al., 1999, "Calibrator Design for the COBE Far-Infrared Absolute Spectrophotometer (FIRAS)," Astrophysical Journal, vol 512, pp 511-520; AntCorr: Reference: T. Mo, (1999), "AMSU-A Antenna Pattern Corrections", IEEE Transactions on Geoscience and Remote Sensing, Vol.37, pp.103-112; Original data normalised. Far->near field effect correction factor included.         Sensor_Type              	long_name         Sensor Type    description       <Sensor type to identify uW, IR, VIS, UV, etc sensor channels   units         N/A    
_FillValue                    �   Sensor_Channel                  	long_name         Sensor Channel     description       List of sensor channel numbers     units         N/A    
_FillValue                  <  �   Polarization                	long_name         Polarization type flag     description       Polarization type flag.    units         N/A    
_FillValue                  <  0   Channel_Flag                	long_name         Channel flag   description       Bit position flags for channels    units         N/A    
_FillValue                  <  l   	Frequency                   	long_name         	Frequency      description       Channel central frequency, f   units         Gigahertz (GHz)    
_FillValue        ��            x  �   
Wavenumber                  	long_name         
Wavenumber     description       Channel central wavenumber, v      units         Inverse centimetres (cm^-1)    
_FillValue        ��            x      	Planck_C1                   	long_name         	Planck C1      description        First Planck coefficient, c1.v^3   units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            x  �   	Planck_C2                   	long_name         	Planck C2      description       Second Planck coefficient, c2.v    units         
Kelvin (K)     
_FillValue        ��            x     Band_C1                 	long_name         Band C1    description       $Polychromatic band correction offset   units         
Kelvin (K)     
_FillValue        ��            x  �   Band_C2                 	long_name         Band C2    description       #Polychromatic band correction slope    units         K/K    
_FillValue        ��            x      Cosmic_Background_Radiance                  	long_name         Cosmic Background Radiance     description       5Planck radiance for the cosmic background temperature      units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            x  x   Solar_Irradiance                	long_name         Kurucz Solar Irradiance    description       *TOA solar irradiance using Kurucz spectrum     units         mW/(m^2.cm^-1)     
_FillValue        ��            x  �   A_earth                    	long_name         A(earth)   description       !Antenna efficiency for earth view      units         N/A    
_FillValue        ?�             h   A_space                    	long_name         A(space)   description       &Antenna efficiency for cold space view     units         N/A    
_FillValue                       #x   
A_platform                     	long_name         A(platform)    description       .Antenna efficiency for satellite platform view     units         N/A    
_FillValue                       1�                              	   
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
�ҹ?� C��P?� !����?� !b�r~?� !6�~�?� !.:�?� �&p�>������>�o^����?�B8�?<��(�y?���he5?9�?)��?�;$�MP?�iFp-�?	[�v?	[�v?	[�v?	[�v?	[�v?	[�v?�z�3��                                                                                                                        ?��"�/?�ċ�N�?�ǁ���?��fS�?�Ҷ�p��?�ۺ����?���leЭ?��}$j?��a�0�?��3��?��|s.��?��-i���?��a�u�?��{W��-?��z�ȰW?���<l?��N�w��?��m����?�㇢�{�?���&Sl�?��k'���?��˩��s?��jWAm�?���
�I?�/��?���f�?﷤׽O�?�d�F+j?�Еt�?�?�Z�I?���k�,?�ݩu�s�?��t��?��cv3?��~S��m?��3%x?���j�ʡ?��ӹ��?��̥��?��A�G̙?��e�r��?��v38n*?��Ș�3�?��5���?��씮�?��M�}�4?��7"���?��y�+�?���P�`�?��.��?�����?��	��0?�߫�o��?���"���?�ھZȇ5?��r[�?��#��a�?�Ո��`�?�ҒUo#�?��\����?￳�}��?������?�ʌ�T��?�ϩ�@e�?���U�?�ު`�!?�Ⴝ��?��;gg�?��y*��?��y�X�?��F���?�怡�H�?���<FH?����5�?��u�D�?��n|>�?�氙B�=?��?���?����I�?�����?��,�1�?��p#6�x?��a�Wt�?�߹��y�?�ܾ0���?��r��da?��ᠽ�q?���b1W?��x֚�?�<Rk�Y?��A^��?��{�vv(?�̫ϟ-�?����A ?��2v�Ac?��j�L�?��%0��?���GS%?��|M�W?�럓{i�?��7��?���6��?���j�~?��\�?��̺bY?��q���?��*VШ�?��'T{?��5?z�?���?���ތ?���\���?��RX)?��'��k?��j�TD?���^��?����U?���l��?�¯���?�r�D�?��x���?�٭w��?��1��W�?��ɬZ�p?��}�� ?��4;��~?��Hr^?��
lE?���ގa?����S�?���D�j?���N���?��ZK��?������?��;zH^�?��\*��?��ZY�?���c���?���O��?��{��?�����p?�ݫ��C-?���N�x?��Ld�w�?��r���?�������?ﵫj�B�?ﭛ�,�?麟���?��c��?�����>�?���)�27?��V��`�?��)x��?���B/?�� ��?���E<�?��S!N��?�╓���?���4�	x?��`�[Q�?�� 0�?���(|�?��]�wk?����?��Δ�3?����m�?��G���6?���6��?���X%��?���>�F?��`�W�?����S#?��r��f3?���f�?��ɕ�{?��3t���?��#�[�?�Ϝ�l��?��+�Q?���b��R?���d�?��>$�v�?��
��>?��ĥ��?��
w�_5?��q{��f?��1��?������?�␽E�?��,G�b?���!K�?���!��?���xr>�?��i��3�?���a:�?��tg��?��΃�?�݆!��?�ۍ��m�?���j2[�?�կ�S��?������?�Ц�`,�?��4=;
?���)"�?ￌ�ྚ?��{\��?�S8Ԗ2?ﰁ`P>?�Õ"=%�?��-~�?��Uբ�?���>��?����!?��W��:?��#`v�?��֝��0?��?��>�?��Q�4Y1?��:U�:�?��z��4r?��`��?��ht��Z?����r�"?��p���?��R����?���b#6?���r �?������}?�����?���ѱ�[?����ߤ?����z&�?���@��?��,��%V?��.x��?��_�iY?��;��U?��3���?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?���7Wa7?��D~�Jj?��=͎͈?�ܤr�a%?�➻���?��]�lV?��$�#?�����N?�����?��4.;gM?��!k��9?��Y �|?��א�H?���Q_?��`�Ӗf?����Z?��.��?�粇6~J?���̽>]?����?�����j?��o�v�?���]�?��E��?�ݒ�E?����&��?��Z�%� ?��}�G7?����1�?��ޑ)�%?��z=<?��l5>$�?������m?���5v�?���\���?��Ѥ�˛?����e?�����m?���4T ?���i�zZ?������?����A?��F�	��?����O�)?��}@��W?�铜�@�?������?��r�?���?���JK8?��:��w?���" �??��x��g?��+��c3?���� Z?��:?��?��
���X?��U*�n?����@d?���,!?�dĕ��?}�־vI�?|)%{��?y���?v�A���?rr���?p
O��?ma(ږ�?k����?i�Z�_�?fgK�Z.?d�])l��?c>u{6"?bhN�77>?ch�z�"4?dMv饺8?e��I�W�?hv.A0�?l[��/��?p�H��B?r���Y��?u�S��?y:�b<Yv?|�"%�_)?�#�@�7?�6gF�?�
Ҿ*?��(vc?��~�n?��iT-��?qב	3�?p�G�̅?or�iy�?m�6_�le?k����b�?g������?fMKd��_?eS�-�[?d_a~RNK?c��L�(i?b��3�A?b�h�/O?bm�q�?a�@u�Mm?bA�w]�?b�,�zX	?c�p���?d�uX�n?fa�y��3?g�F�M�?j�F#?��?m���?obW�D�?q�Ǆ�?r3B#�?r豓�A1?s�\>���?t�V��?u��ʃQ?v����2�?��#5�?}U��G?zLn�Du�?w�弨ee?s
#���?p?��Â�?m�w ���?k����?j�ؖ���?i�b�+��?ik`v�?h���Z��?h9����?h7J<�?h��e}z"?h�I���P?h^�r;�?h����h=?i/���;?i�zO� �?jץ[�S�?l����?m��� �?oAE26?q�V@bS?t=��Bi??y�g��>?|/��a�?.�,N��?��f֧�?r�=�?{YU���?yJlO�	?u��(��?qg�~4?i�L+D��?g9���?e���M�?dR�9+?c��{��?bѽ�1IQ?a�􌉦?`[��o??_�� ���?_&�m+U?_�絳V?`e�d?a�8�d�`?c1�$��8?d8��X��?eP�l?gX&Y��?h��%	�?k z,�b�?m|���?r t�~3?wo��>R7?{��EY?~v'	?�T�qcc?tk9H��?r�-2wm�?qn9�?n�v~n��?i�Z��<E?e4m!�l?b�5I���?b_�X���?bN����?a��|?ar�vT��?a�B��1�?azXO��?a�����?c��Gj?c�iLhw?d��v	�?fXJ�s�?gk�U��?i�
x$ �?mMQ�� ?p�D�G�E?s32U��?u�`�=N?zPfxj"?(�b�?�R���%]?�P\��?��	iX?���L'?~��Y�B�?z�K��?wzX���?t� �7�?q���҂e?p0�7%J�?oO3wLW?n�-+?l��K�j?k�ˬ>Y�?jXN�
�?h�N~�׭?g��7�?gM�H��?fOP5Р?e�՜�&?e�W��1�?f! iJ?gw����?hm����{?iR��f*?j�C�??j�%�9_?k�W~_t?m˽�y\?pǉ$S��?s��g�~?ueH��?w҇���?{y7�DE?~�N:�?{����ǹ?y#TV��?v�����?r�=Ȓ1r?p�e�b�T?n��3��u?m�T3��?mM���[?l�P�� �?kձ%/��?k��Ud+?j��S�k?i���X?i�DBr\?jh�����?mߨ|0]?p+'/��D?p����?q����(?r��$��D?tَ-��j?v$�W���?w[=��(?x>mQ��?z��r	�?�jSJb?�MP����?��\�e��?��.�v�?}�ύ�Fh?{r���]�?x�ۡ��?v��(��?r��©�?n�n�E0�?m%�v��?lb_����?k�Q��I?i�lL�@?h�kA��?g��&�a?g�����u?g��Л�q?h/����#?h��!�?h͝�9�?i =��?i�A򕓱?jY^���?k%��.ȶ?l���M?l����+?n-#��4?p�'9��?rb����?v]�wW,n?y�+�Qlc?|��V'�-?�?�ѾG]?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?w��?�Ey?t��Q;<?r��^�	?q8{����?lv,�]f�?h�XT���?gZg�0�?fH�\~pl?e�n���?d�T,j}?c�ĊO?c�& {?c����ra?d���?e��N�?fR�3���?f~�ka�?gK�`G?h���?i�J�?j7���(�?kN�G`?l:Q�,7?m����ad?p��*:sX?st�\U�`?v����?y&�?c��?{b�s�?}�(bӛ�?j���ke?hOf.�7f?f勃�W?e�\�ڭ�?b���+?a��*E�?a�Yv`��?a���5-,?a�ʛ��\?a�tO��Q?a˴y� �?a��]v}r?b5Q2��p?b�l�)߿?b�x����?b�$&���?b�{���?b��c<!?b��1�?b�Q��F?c#��SZ�?cu���i?c�O�l�?d ���~�?d{ �q?f\m�)�?h8�M��?i診��?kz�@?m0�o�`>���Ϲ>����I��>���8��>�ԗݐ>�o=�3�>�>�vi�>�zM��W�>���E���>t`k>��B|�>섅���>>�9(����>�)q$�>�Yt���?>쿼͇w}>�p�A�>�>Z�0�>�^�

�[>쯘Tv�>��^�>��aU��>�S��U��>�6��c5>��g	�b�>�!
��y�>�^�p�>�����f>�.�^�K?�$@̛�?��*��?$����?#ߧ�	�?!��6q�? �V
�?��W��?��/0�?�5�z��?&"և�?/���T?�q��?���S8�?LylPܶ?<U���?���S8�?9;R�[�?S�N}{?͛��?�ω��?���S8�?�$���?ךx\W?�-��'e?7�Oz^#?�{MIn?!S�3��?"iFa{<X?$8�-��?&KW��te?)~ϽdkN?,�$�x�?L�z�y?�}�O[n?M[���c?��.��?�Ӳ��?Ê�-�?�h���?�<B�?���@?��f�v?i��)S?�1K��)?Z��|N�?ܹ1��u?�9ǳ�j?���e�H?�b۲�?pL�{F�?ǆ@`��?�F�?q�\|z�?���n�b? 
!�TΨ? S0�s��? �I�7��?!�l�1?!��3�4?"��ǐ�?"�ȭOZ?#a#�s�?����?9�8=\?��,f�?izw�?�B44?I��?��
�? ^��8�?�a�ڎ?+zcQ�h?a]Z�3
?�@�A/?���W�?|M�$
e?6C�"�?��1���?���,?T (� H?��u���?F����]?�@��|?���ȴ?�4ٙ��?�Ĝ�v�?�^z�Q?��ο]? i��hP?!|^��?"yB ;?#�f�"�?PDw�?�G�x?�f���?;��}��?6Q�u3�?��N�'2?�Hw"�;?��>#P*?�}�D?^�Z�n�?�(��C?ز���?�+~U�M?���?���G"�?�~��]0?#f��q?�*���?b,��?�M�`T�?3�C=�?�6嶌?zI����?JN�rW�?����={?#0kَ? �bK�+?",���u�?$(܏��x?&��P�q?2Yg�=?�m��_?��u!�?z�VQ�F?�	9��?ŕ��q>?hu�F;?�Rd{U�?�<��?���?���?�*�_6?�X)t�r?��v�V?�W{Rl?y��"8?��"*?��/�?��}��?�����?�A���?/��`�K?|�nyTY?,ăm�?���װ�?����nl?�	jvY?���'�?�����?~@�b�?@ ��U?m�B��A?r�;{�?�*�.�?�ֿR�1?��^�?�9�{��?�o?���?�M�V?�A/�?�Rd{U�?���t��?�P�zQ?�4�z?f��_c�?~�O��?\c����?\c����?P@cwP�?L4�x�p?`p����?�*�Ľ?�Ha??Q.���?(�J��x?�8�'	G?K��Z:f?(I���\?�n�p"�? �\�P�f? S�o���?�9x��?'<�l�?DW:9:t?l�q|z.?!��\?� BVj0?�X3=?��u?TK�;�E?���aN?t��~?��~�?���@?��3��=?�_���G?��ڨA�??��կ�?}�i;m?���&?RÆ�9�?�
�B?���C ?�9	�L�? n��U? ٚ�+��?!f
�i?"(��<�I?#�"%�<?#˒���?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?[E��0?��3�??Uvj�tw?RÆ�9�?b���h�?��V�9?���u��?��VZ�?���H
?�ƨ�?[E��.?�%�Pxp?(nm��K?���C? �"�? 0Ϥ*�I? ���b? ']B�? &� $Q? $��U? Ag��%? ���b��? �����N?!���d�?!��g�]@?"[���?"�J���?#Q��I�?#�_u=?$q��5�?:�}J�h?:#$�H;?:,lb��8?:7�mvBv?:=#�߷�?:���P��?:��8��?:��+??:�
��g?;)ܭ��?;k�R�?;���?<Vc��?<u�w�?<�357�?=)�^%*�?=ɉi��?=:�yr�?=
^�H<�?=�N��?=:�yr�?=G�&��?=a�t�GZ?=��"w�?=�����?=�����:?=�&3�2?>X�U??>J �s:?>X��@�