FasdUAS 1.101.10   ��   ��    k             l     ��  ��    x r cd to the current finder window folder in iTerm. Or drag a folder onto this script to cd to that folder in iTerm.     � 	 	 �   c d   t o   t h e   c u r r e n t   f i n d e r   w i n d o w   f o l d e r   i n   i T e r m .   O r   d r a g   a   f o l d e r   o n t o   t h i s   s c r i p t   t o   c d   t o   t h a t   f o l d e r   i n   i T e r m .   
  
 l     ��  ��    x r found this script in the comments of this article: http://www.macosxhints.com/article.php?story=20050924210643297     �   �   f o u n d   t h i s   s c r i p t   i n   t h e   c o m m e n t s   o f   t h i s   a r t i c l e :   h t t p : / / w w w . m a c o s x h i n t s . c o m / a r t i c l e . p h p ? s t o r y = 2 0 0 5 0 9 2 4 2 1 0 6 4 3 2 9 7      l     ��  ��    [ U Modified by [db] using f3lix suggestions on http://snippets.dzone.com/posts/show/961     �   �   M o d i f i e d   b y   [ d b ]   u s i n g   f 3 l i x   s u g g e s t i o n s   o n   h t t p : / / s n i p p e t s . d z o n e . c o m / p o s t s / s h o w / 9 6 1      l     ��������  ��  ��        l     ��  ��      Instructions for use:     �   ,   I n s t r u c t i o n s   f o r   u s e :      l     ��  ��    ~ x paste this script into Script Editor and save as an application to ~/Library/Scripts/Applications/Finder/cd to in iTerm     �   �   p a s t e   t h i s   s c r i p t   i n t o   S c r i p t   E d i t o r   a n d   s a v e   a s   a n   a p p l i c a t i o n   t o   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / F i n d e r / c d   t o   i n   i T e r m     !   l     �� " #��   " = 7 [db] or save it where ever you like� it doesn't matter    # � $ $ n   [ d b ]   o r   s a v e   i t   w h e r e   e v e r   y o u   l i k e &   i t   d o e s n ' t   m a t t e r !  % & % l     �� ' (��   ' W Q run via the AppleScript Menu item (http://www.apple.com/applescript/scriptmenu/)    ( � ) ) �   r u n   v i a   t h e   A p p l e S c r i p t   M e n u   i t e m   ( h t t p : / / w w w . a p p l e . c o m / a p p l e s c r i p t / s c r i p t m e n u / ) &  * + * l     �� , -��   , s m Or better yet, Control-click and drag it to the top of a finder window so it appears in every finder window.    - � . . �   O r   b e t t e r   y e t ,   C o n t r o l - c l i c k   a n d   d r a g   i t   t o   t h e   t o p   o f   a   f i n d e r   w i n d o w   s o   i t   a p p e a r s   i n   e v e r y   f i n d e r   w i n d o w . +  / 0 / l     �� 1 2��   1 B < Activate it by clicking on it or dragging a folder onto it.    2 � 3 3 x   A c t i v a t e   i t   b y   c l i c k i n g   o n   i t   o r   d r a g g i n g   a   f o l d e r   o n t o   i t . 0  4 5 4 l     ��������  ��  ��   5  6 7 6 l     �� 8 9��   8 M G Another nice touch is to give the saved script the same icon as iTerm.    9 � : : �   A n o t h e r   n i c e   t o u c h   i s   t o   g i v e   t h e   s a v e d   s c r i p t   t h e   s a m e   i c o n   a s   i T e r m . 7  ; < ; l     �� = >��   = [ U To do this, in the finder, Get info (Command-I) of both iTerm and this saved script.    > � ? ? �   T o   d o   t h i s ,   i n   t h e   f i n d e r ,   G e t   i n f o   ( C o m m a n d - I )   o f   b o t h   i T e r m   a n d   t h i s   s a v e d   s c r i p t . <  @ A @ l     �� B C��   B V P Click the iTerm icon (it will highlight blue) and copy it by pressing Comand-C.    C � D D �   C l i c k   t h e   i T e r m   i c o n   ( i t   w i l l   h i g h l i g h t   b l u e )   a n d   c o p y   i t   b y   p r e s s i n g   C o m a n d - C . A  E F E l     �� G H��   G C = Click on this script's icon and paste by pressing Command-V.    H � I I z   C l i c k   o n   t h i s   s c r i p t ' s   i c o n   a n d   p a s t e   b y   p r e s s i n g   C o m m a n d - V . F  J K J l     ��������  ��  ��   K  L M L l     �� N O��   N � z Another way to give it the same icon as iTerm is to save the script as an application bundle (instead of an application),    O � P P �   A n o t h e r   w a y   t o   g i v e   i t   t h e   s a m e   i c o n   a s   i T e r m   i s   t o   s a v e   t h e   s c r i p t   a s   a n   a p p l i c a t i o n   b u n d l e   ( i n s t e a d   o f   a n   a p p l i c a t i o n ) , M  Q R Q l     �� S T��   S ? 9  then copy the icon by entering these commands in iTerm:    T � U U r     t h e n   c o p y   t h e   i c o n   b y   e n t e r i n g   t h e s e   c o m m a n d s   i n   i T e r m : R  V W V l     �� X Y��   X [ U $ cd ~/Library/Scripts/Applications/Finder/cd\ to\ in\ iTerm.app/Contents/Resources/    Y � Z Z �   $   c d   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / F i n d e r / c d \   t o \   i n \   i T e r m . a p p / C o n t e n t s / R e s o u r c e s / W  [ \ [ l     �� ] ^��   ]   $ rm droplet.icns    ^ � _ _ $   $   r m   d r o p l e t . i c n s \  ` a ` l     �� b c��   b N H $ cp /Applications/iTerm.app/Contents/Resources/iTerm.icns droplet.icns    c � d d �   $   c p   / A p p l i c a t i o n s / i T e r m . a p p / C o n t e n t s / R e s o u r c e s / i T e r m . i c n s   d r o p l e t . i c n s a  e f e l     �� g h��   g J D $ touch ~/Library/Scripts/Applications/Finder/cd\ to\ in\ iTerm.app    h � i i �   $   t o u c h   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / F i n d e r / c d \   t o \   i n \   i T e r m . a p p f  j k j l     ��������  ��  ��   k  l m l l     �� n o��   n , & script was opened by click in toolbar    o � p p L   s c r i p t   w a s   o p e n e d   b y   c l i c k   i n   t o o l b a r m  q r q l     ��������  ��  ��   r  s t s i      u v u I     ������
�� .aevtoappnull  �   � ****��  ��   v k     + w w  x y x O     # z { z Q    " | } ~ | r      �  l    ����� � c     � � � n     � � � m    ��
�� 
cfol � l    ����� � 4   �� �
�� 
cwin � m   	 
���� ��  ��   � m    ��
�� 
TEXT��  ��   � o      ���� 0 
currfolder 
currFolder } R      ������
�� .ascrerr ****      � ****��  ��   ~ r    " � � � l     ����� � I    �� � �
�� .earsffdralis        afdr � m    ��
�� afdmdesk � �� ���
�� 
rtyp � m    ��
�� 
TEXT��  ��  ��   � o      ���� 0 
currfolder 
currFolder { m      � ��                                                                                  MACS  alis    t  Macintosh HD               �a#\H+     4
Finder.app                                                      '�϶�U        ����  	                CoreServices    �ai�      ϶��       4   1   0  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   y  ��� � I   $ +�� ����� 0 cd_to CD_to �  � � � o   % &���� 0 
currfolder 
currFolder �  ��� � m   & '��
�� boovfals��  ��  ��   t  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 0 * script run by draging file/folder to icon    � � � � T   s c r i p t   r u n   b y   d r a g i n g   f i l e / f o l d e r   t o   i c o n �  � � � i     � � � I     �� ���
�� .aevtodocnull  �    alis � l      ����� � o      ���� 0 thelist theList��  ��  ��   � k     [ � �  � � � r      � � � m     ��
�� boovfals � o      ���� 0 	newwindow 	newWindow �  � � � X    X ��� � � k    S � �  � � � r     � � � c     � � � o    ���� 0 thepath thePath � m    ��
�� 
TEXT � o      ���� 0 thepath thePath �  � � � Z    G � ����� � H     � � l    ����� � D     � � � o    ���� 0 thepath thePath � m     � � � � �  :��  ��   � k   ! C � �  � � � r   ! 2 � � � l  ! 0 ����� � I  ! 0���� �
�� .sysooffslong    ��� null��   � �� � �
�� 
psof � m   # $ � � � � �  : � �� ���
�� 
psin � c   % , � � � l  % * ����� � l  % * ����� � n   % * � � � 1   ( *��
�� 
rvse � n   % ( � � � 2   & (��
�� 
cha  � o   % &���� 0 thepath thePath��  ��  ��  ��   � m   * +��
�� 
TEXT��  ��  ��   � o      ���� 0 x   �  ��� � r   3 C � � � c   3 A � � � l  3 ? ����� � n   3 ? � � � 7  4 ?�� � �
�� 
cha  � m   8 :����  � d   ; > � � l  < = ����� � o   < =���� 0 x  ��  ��   � o   3 4���� 0 thepath thePath��  ��   � m   ? @��
�� 
TEXT � o      ���� 0 thepath thePath��  ��  ��   �  � � � I   H O�� ����� 0 cd_to CD_to �  � � � o   I J���� 0 thepath thePath �  ��� � o   J K���� 0 	newwindow 	newWindow��  ��   �  ��� � l  P S � � � � r   P S � � � m   P Q��
�� boovtrue � o      ���� 0 	newwindow 	newWindow � 0 * create window for any other files/folders    � � � � T   c r e a t e   w i n d o w   f o r   a n y   o t h e r   f i l e s / f o l d e r s��  �� 0 thepath thePath � o    ���� 0 thelist theList �  ��� � L   Y [����  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � + % cd to the desired directory in iterm    � � � � J   c d   t o   t h e   d e s i r e d   d i r e c t o r y   i n   i t e r m �  � � � i     � � � I      �� ���� 0 cd_to CD_to �  � � � o      �~�~ 0 thedir theDir �  ��} � o      �|�| 0 	newwindow 	newWindow�}  �   � k     r � �  � � � r     	 � � � c      � � � n      �  � 1    �{
�{ 
strq  n      1    �z
�z 
psxp o     �y�y 0 thedir theDir � m    �x
�x 
TEXT � o      �w�w 0 thedir theDir � �v O   
 r k    q  I   �u�t�s
�u .miscactvnull��� ��� null�t  �s   	
	 I   �r�q
�r .sysodelanull��� ��� nmbr m    �p�p �q  
  l   �o�o   "  talk to the first terminal     � 8   t a l k   t o   t h e   f i r s t   t e r m i n a l    l   �n�n    tell the first terminal    � . t e l l   t h e   f i r s t   t e r m i n a l  l   �m�l�k�m  �l  �k    r    ! l   �j�i I   �h�g
�h .Itrmnwwpnull���     **** m     �  D e f a u l t�g  �j  �i   o      �f�f 
0 myterm    �e  O   " q!"! k   & p## $%$ Q   & B&'(& k   ) 1)) *+* l  ) )�d,-�d  , @ : launch a default shell in a new tab in the same terminal    - �.. t   l a u n c h   a   d e f a u l t   s h e l l   i n   a   n e w   t a b   i n   t h e   s a m e   t e r m i n a l  + /�c/ I  ) 1�b0�a
�b .ascrnoop****      � ****0 4   ) -�`1
�` 
Trms1 m   + ,22 �33  D e f a u l t   S e s s i o n�a  �c  ' R      �_�^�]
�_ .ascrerr ****      � ****�^  �]  ( I  9 B�\45
�\ .sysodlogaskr        TEXT4 m   9 :66 �77 ^ T h e r e   w a s   a n   e r r o r   c r e a t i n g   a   n e w   t a b   i n   i T e r m .5 �[8�Z
�[ 
btns8 J   ; >99 :�Y: m   ; <;; �<<  O K�Y  �Z  % =�X= O   C p>?> Q   J o@AB@ k   M ZCC DED l  M M�WFG�W  F   cd to the finder window   G �HH 0   c d   t o   t h e   f i n d e r   w i n d o wE I�VI I  M Z�U�TJ
�U .Itrmsntxnull���     obj �T  J �SK�R
�S 
TextK b   Q VLML m   Q TNN �OO  c d  M o   T U�Q�Q 0 thedir theDir�R  �V  A R      �P�O�N
�P .ascrerr ****      � ****�O  �N  B I  b o�MPQ
�M .sysodlogaskr        TEXTP m   b eRR �SS \ T h e r e   w a s   a n   e r r o r   c d i n g   t o   t h e   f i n d e r   w i n d o w .Q �LT�K
�L 
btnsT J   f kUU V�JV m   f iWW �XX  O K�J  �K  ? l  C GY�I�HY 4  C G�GZ
�G 
TrmsZ m   E F�F�F���I  �H  �X  " o   " #�E�E 
0 myterm  �e   m   
 [[�                                                                                  ITRM  alis    H  Macintosh HD               �a#\H+     V	iTerm.app                                                       �N�5�        ����  	                Applications    �ai�      �5�       V  $Macintosh HD:Applications: iTerm.app   	 i T e r m . a p p    M a c i n t o s h   H D  Applications/iTerm.app  / ��  �v   � \]\ l     �D�C�B�D  �C  �B  ] ^�A^ l     �@�?�>�@  �?  �>  �A       �=_`abc�<�;�=  _ �:�9�8�7�6�5
�: .aevtoappnull  �   � ****
�9 .aevtodocnull  �    alis�8 0 cd_to CD_to�7 0 
currfolder 
currFolder�6  �5  ` �4 v�3�2de�1
�4 .aevtoappnull  �   � ****�3  �2  d  e  ��0�/�.�-�,�+�*�)�(�'
�0 
cwin
�/ 
cfol
�. 
TEXT�- 0 
currfolder 
currFolder�,  �+  
�* afdmdesk
�) 
rtyp
�( .earsffdralis        afdr�' 0 cd_to CD_to�1 ,�   *�k/�,�&E�W X  ���l 	E�UO*�fl+ 
a �& ��%�$fg�#
�& .aevtodocnull  �    alis�% 0 thelist theList�$  f �"�!� ��" 0 thelist theList�! 0 	newwindow 	newWindow�  0 thepath thePath� 0 x  g ���� �� �������
� 
kocl
� 
cobj
� .corecnte****       ****
� 
TEXT
� 
psof
� 
psin
� 
cha 
� 
rvse� 
� .sysooffslong    ��� null� 0 cd_to CD_to�# \fE�O S�[��l kh ��&E�O�� '*����-�,�&� E�O�[�\[Zk\Z�'2�&E�Y hO*��l+ OeE�[OY��Ohb � ���hi�� 0 cd_to CD_to� �j� j  ��� 0 thedir theDir� 0 	newwindow 	newWindow�  h ���
� 0 thedir theDir� 0 	newwindow 	newWindow�
 
0 myterm  i �	��[����2��� 6��;����N��RW
�	 
psxp
� 
strq
� 
TEXT
� .miscactvnull��� ��� null
� .sysodelanull��� ��� nmbr
� .Itrmnwwpnull���     ****
� 
Trms
� .ascrnoop****      � ****�  �   
�� 
btns
�� .sysodlogaskr        TEXT
�� 
Text
�� .Itrmsntxnull���     obj � s��,�,�&E�O� e*j Okj O�j E�O� L *��/j 
W X  ���kvl O*�i/ ' *a a �%l W X  a �a kvl UUUc �kk 0 d a t a : I m p o r t a n t : K e y s : A W S :�<  �;  ascr  ��ޭ