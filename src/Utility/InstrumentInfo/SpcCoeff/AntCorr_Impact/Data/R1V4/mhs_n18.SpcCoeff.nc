CDF       
      
n_Channels        n_FOVs     Z         write_module_history      M$Id: SpcCoeff_netCDF_IO.f90 741 2007-07-13 13:40:58Z paul.vandelst@noaa.gov $      creation_date_and_time        2007/07/16, 12:53:05 -0400UTC      Release             Version             	Sensor_Id         mhs_n18    WMO_Satellite_Id         �   WMO_Sensor_Id            �   
AC_Release              
AC_Version              title         "Spectral coefficients for mhs_n18.     history      $Id: Create_MW_SpcCoeff.f90 749 2007-07-16 15:32:07Z paul.vandelst@noaa.gov $; MW_SensorData: $Id: MW_SensorData_Define.f90 738 2007-07-11 21:20:12Z paul.vandelst@noaa.gov $; AntCorr: $Id: AAPP_AMSU_AntCorr_ASC2NC.f90 727 2007-07-05 18:08:09Z paul.vandelst@noaa.gov $    comment      �Boxcar spectral response assumed; CMB value from J.C. Mather, et. al., 1999, "Calibrator Design for the COBE Far-Infrared Absolute Spectrophotometer (FIRAS)," Astrophysical Journal, vol 512, pp 511-520; AntCorr: AAPP v6.4 fdf data; Reference: Hewison, T.J. and R.Saunders (1996), "Measurements of the AMSU-B antenna pattern", IEEE Transactions on Geoscience and Remote Sensing, Vol.34, pp.405-412         Sensor_Type              	long_name         Sensor Type    description       <Sensor type to identify uW, IR, VIS, UV, etc sensor channels   units         N/A    
_FillValue                    �   Sensor_Channel                  	long_name         Sensor Channel     description       List of sensor channel numbers     units         N/A    
_FillValue                    �   Polarization                	long_name         Polarization type flag     description       Polarization type flag.    units         N/A    
_FillValue                    �   Channel_Flag                	long_name         Channel flag   description       Bit position flags for channels    units         N/A    
_FillValue                    �   	Frequency                   	long_name         	Frequency      description       Channel central frequency, f   units         Gigahertz (GHz)    
_FillValue        ��            (     
Wavenumber                  	long_name         
Wavenumber     description       Channel central wavenumber, v      units         Inverse centimetres (cm^-1)    
_FillValue        ��            (  4   	Planck_C1                   	long_name         	Planck C1      description        First Planck coefficient, c1.v^3   units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            (  \   	Planck_C2                   	long_name         	Planck C2      description       Second Planck coefficient, c2.v    units         
Kelvin (K)     
_FillValue        ��            (  �   Band_C1                 	long_name         Band C1    description       $Polychromatic band correction offset   units         
Kelvin (K)     
_FillValue        ��            (  �   Band_C2                 	long_name         Band C2    description       #Polychromatic band correction slope    units         K/K    
_FillValue        ��            (  �   Cosmic_Background_Radiance                  	long_name         Cosmic Background Radiance     description       5Planck radiance for the cosmic background temperature      units         mW/(m^2.sr.cm^-1)      
_FillValue        ��            (  �   Solar_Irradiance                	long_name         Kurucz Solar Irradiance    description       *TOA solar irradiance using Kurucz spectrum     units         mW/(m^2.cm^-1)     
_FillValue        ��            (  $   A_earth                    	long_name         A(earth)   description       !Antenna efficiency for earth view      units         N/A    
_FillValue        ?�             L   A_space                    	long_name         A(space)   description       &Antenna efficiency for cold space view     units         N/A    
_FillValue                        \   
A_platform                     	long_name         A(platform)    description       .Antenna efficiency for satellite platform view     units         N/A    
_FillValue                       .l                     	   	   
   
   	                    @V@     @c�     @f��E��@f��E��@g��E��@����'@򤫿��@uX��'@uX��'@dr#W�5?4l<M�1�?\	@t��?fNR�)g�?fNR�)g�?h���ܧ@�M��@#�kA��@!�U���@!�U���@"DW>0v�<د�  �/t1��  �8����  �k��r�  �$�t�  ?� F�Y?� ɾ�*?� �_�?���E�?� ��3�?���rx?%���i?u ����?u ����? $/���                                        ?����$?��1/L�?������?��.�C�?��v% J�?�����D?����I,?���bb˧?��Ѯ��?��^���?��G^?��Y��|�?��[���r?��]�
_?��x���]?��r!���?������?�����yF?��*�i�m?����G�?��2�%�?���O�B�?��v�	?����L�X?����d�?�����?���N�Ġ?��˒:)�?���Y1�}?���Ռ��?��� )k3?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?����c#�?�����;�?���9_J?������"?���� q??�����?���+�ʬ?��\l�?���A�?���;�?��`Ï6i?����r&?���o��?����l�?��,�H��?��|x �?���`��?��;���v?���'ͼ?���>-b?����?�?��5���?��% J�#?��.Y�?����$�?�-V?��t2?������K?���H���?���Vh�?��D$>�?��p.fD�?����V�?���
��?�� �~�?��>�h8?��;���v?��V�3&�?��r!���?���;�?����2�_?�����>B?���ҝ�&?������?���r!��?��[>?�����?���R��?�� 1ί%?��&|k�i?��G��?����7"?��Z��O?����?��8��?��y��z?��ɟ��?��7T*$?���J�\?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?����!�?�      ?����!�?����B�?����c#�?�����;�?���Q�Sa?����k�?���Φ�?���r��?���@R�g?���'s�P?��˒:)�?����eV?���gƸ�?���ҍ .?����_x?��{�!�g?��b��}V?��<�S�?��
�q�?���;�?���!�B?��g3��?���#��x?���B҅?������?�����e?���*,#t?��MUi?��<W�#F?��fI
5?����d�@?���VSɬ?����d?���|(?��'9)�9?��: �?������?��'j@?����ud?�� ���?������?��x��3?���L��?��La�b,?���=d�?���1��?����ދ;?���57r?��z�T�?���h�6�?��˷���?��ɟ��?��>��@?��}� �~?��}� �~?������"?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�����/�?���9_J?����ﲫ?�����9?���G�M�?�������?�����?���D���?�����?���f��?���c��?��.n�TG?���(V`_?����$?��1/L�?������?��.�C�?��v% J�?�����D?����I,?���bb˧?��Ѯ��?��^���?��G^?��Y��|�?��[���r?��]�
_?��x���]?��r!���?������?�����yF?��*�i�m?����G�?��2�%�?���O�B�?��v�	?����L�X?����d�?�����?���N�Ġ?��˒:)�?���Y1�}?���Ռ��?��� )k3?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?����c#�?�����;�?���9_J?������"?���� q??�����?���+�ʬ?��\l�?���A�?���;�?��`Ï6i?����r&?���o��?����l�?��,�H��?��|x �?���`��?��;���v?���'ͼ?���>-b?����?�?��5���?��% J�#?��.Y�?����$�?�-V?��t2?������K?���H���?���Vh�?��D$>�?��p.fD�?����V�?���
��?�� �~�?��>�h8?��;���v?��V�3&�?��r!���?���;�?����2�_?�����>B?���ҝ�&?������?���r!��?��[>?�����?���R��?�� 1ί%?��&|k�i?��G��?����7"?��Z��O?����?��8��?��y��z?��ɟ��?��7T*$?���J�\?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?����!�?�      ?����!�?����B�?����c#�?�����;�?���Q�Sa?����k�?���Φ�?���r��?���@R�g?���'s�P?��˒:)�?����eV?���gƸ�?���ҍ .?����_x?��{�!�g?��b��}V?��<�S�?��
�q�?���;�?���!�B?��g3��?���#��x?���B҅?������?Y��ʁ��?X���F�?W��|��?U�^N�?T�Ҳ��M?RQ;[���?Q]�U\R�?P�7�T7?P����?N��>[�b?M��@ ��?K����i?I�>�'�?F��G��?C�F�
?;�n�M?8��{?4�`�G(?28腏�?.�J�!?)�9W��?$���`�:?!
8�C?r}�ݹ�?���8�K>��g�Lf>�\1Y>_�>�*sq�T>�����h�>��̫֔?>������                                                                                                                                                                                                                                                        >�*sq�T>�����h�>������>�%���? @��>!?�|�&�?uMUi?r}�ݹ�?�M7�7m?#�F�
?)���kv?01�n�F?3D�b���?9���kv?>���+�Y?B}s�%?Dr}�ݹ�?G�|�&�?I�c���?L��Jw?P���a?Q�|�&�+?S��j��?X�ɣL��?[ނ׶4�?`bM���?c�����?g"5��?2���?7�v��?7C�c�Hk?6��5�?6���}�?5Cx$��?4�`�G(?4��%_?4P�ܜM�?4@(����?4���+�?3�x�?3ʸ��=?3��AƆ?3D�b���?:y�ɟ�?:6��C-?:�:!d?9�9W��?9��.��?9��.��?9��6u��?0�0�7�?&�\��w6? �i�t��?H@�q��?
6��C-?
��!�?
��!�?fQ�Z�                                                                                                                                                                                                                                                                        >������        >������>������>�*sq�T>�����h�>�\1Y>_�>��|�&�>�\1Y>_�>������>��̫֔?>��F�
>�6��C->�uMUi?fQ�Z�?�\��w6?
��!�?���3�?�*0U2a?aՈ]1?���̖F?#�F�
?0�����?4�`�G(?:6��C-?@�����?D@(����?-�M7�7m?3fQ�Z�?2��+�Q?28腏�?4�`�G(?:6��C-?=z��?@���a?A�D���?Cd�?D��?N�h?Dr}�ݹ�?DP�ܜM�?D���+�?C�7T*?E�P��sT?C�7T*?B8腏�?@������?=�0��?:��¨�?7��1���?*Xp�]�?uMUi?�,+��>�����h�>�����h�>�����h�>�%���>�%���>�%���                                                                                                                                                                                                                                                                                                                                                                                >������>������>�uMUi>�����h�>�\1Y>_�?Y�����?�|�&�?�ؐOm�?� �)(?"Y�����?&i�г[?-z��?1n�L��?Y��ʁ��?X���F�?W��|��?U�^N�?T�Ҳ��M?RQ;[���?Q]�U\R�?P�7�T7?P����?N��>[�b?M��@ ��?K����i?I�>�'�?F��G��?C�F�
?;�n�M?8��{?4�`�G(?28腏�?.�J�!?)�9W��?$���`�:?!
8�C?r}�ݹ�?���8�K>��g�Lf>�\1Y>_�>�*sq�T>�����h�>��̫֔?>������                                                                                                                                                                                                                                                        >�*sq�T>�����h�>������>�%���? @��>!?�|�&�?uMUi?r}�ݹ�?�M7�7m?#�F�
?)���kv?01�n�F?3D�b���?9���kv?>���+�Y?B}s�%?Dr}�ݹ�?G�|�&�?I�c���?L��Jw?P���a?Q�|�&�+?S��j��?X�ɣL��?[ނ׶4�?`bM���?c�����?g"5��?2���?7�v��?7C�c�Hk?6��5�?6���}�?5Cx$��?4�`�G(?4��%_?4P�ܜM�?4@(����?4���+�?3�x�?3ʸ��=?3��AƆ?3D�b���?:y�ɟ�?:6��C-?:�:!d?9�9W��?9��.��?9��.��?9��6u��?0�0�7�?&�\��w6? �i�t��?H@�q��?
6��C-?
��!�?
��!�?fQ�Z�                                                                                                                                                                                                                                                                        >������        >������>������>�*sq�T>�����h�>�\1Y>_�>��|�&�>�\1Y>_�>������>��̫֔?>��F�
>�6��C->�uMUi?fQ�Z�?�\��w6?
��!�?���3�?�*0U2a?aՈ]1?���̖F?#�F�
?0�����?4�`�G(?:6��C-?@�����?D@(����?U���6?W?S߰���?R�O�[�?Q��m��?Pn��2n?K����i?ITd�"�&?F�����?D���`�:?B���?@j�N��?=��@ ��?:�:!d?7ewS�F?4a��=�?0���3�?.�.*k?+d�Ti�?(�W���?&H@�q��?#d�? �i�t��?Ɋ"-Qr?�x�wN�?�̫֔??�F�
>�*sq�T>�CRe'�>�\1Y>_�>�*sq�T>������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ?CL��aI�??��D��V?>���+�Y?=Ѣ�Y6?=z��?;��2��?;2�m��?:y�ɟ�?9�9W��?9��xy?8PX��D?7�! ���?7v>J�j3?7�|�&�?6��5�?,O��3 �?+�n�M?+�nC�y�?+CRe'�?+!�u�6*?*������?*Xp�]�?*T���R?)���kv?)��.��?%��[�?%��[�?!��+��?m�O��
?fQ�Z�?~�E�]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ?R�=�#?Qb(D�c?Q+�nz1?P�L��V?P����?Ll�P�?J&�{�??H.��;i?FH@�q��?Da��=�?B���?@�����?>%�����?:������?7C�c�Hk?)*sq�T?)��xy?(�W���?(�W���?(�ɣL��?(�ɣL��?(�;�4�?(�;�4�?(�;�4�?%]_V���? �i�t��? �����?y�ɟ�?~�E�]?~�E�]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ?U���6?W?S߰���?R�O�[�?Q��m��?Pn��2n?K����i?ITd�"�&?F�����?D���`�:?B���?@j�N��?=��@ ��?:�:!d?7ewS�F?4a��=�?0���3�?.�.*k?+d�Ti�?(�W���?&H@�q��?#d�? �i�t��?Ɋ"-Qr?�x�wN�?�̫֔??�F�
>�*sq�T>�CRe'�>�\1Y>_�>�*sq�T>������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ?CL��aI�??��D��V?>���+�Y?=Ѣ�Y6?=z��?;��2��?;2�m��?:y�ɟ�?9�9W��?9��xy?8PX��D?7�! ���?7v>J�j3?7�|�&�?6��5�?,O��3 �?+�n�M?+�nC�y�?+CRe'�?+!�u�6*?*������?*Xp�]�?*T���R?)���kv?)��.��?%��[�?%��[�?!��+��?m�O��
?fQ�Z�?~�E�]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        