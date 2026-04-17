# ==============================================================================
# AUTO-ELEVAÇÃO PARA ADMINISTRADOR (OBRIGATÓRIO)
# ==============================================================================
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Add-Type -AssemblyName PresentationFramework

# ==============================================================================
# XAML - MOTOR VISUAL COMPLETO
# ==============================================================================
$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ULTRA BOOST V1.0 - LITE" Height="900" Width="1450" 
        WindowStartupLocation="CenterScreen" Background="#0F0F11" FontFamily="Segoe UI">
    
    <Window.Resources>
        <Style TargetType="Button">
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" CornerRadius="6" BorderThickness="0">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True"><Setter Property="Opacity" Value="0.85"/></Trigger>
                <Trigger Property="IsEnabled" Value="False"><Setter Property="Opacity" Value="0.5"/></Trigger>
            </Style.Triggers>
        </Style>

        <Style TargetType="TabItem">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="#888888"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Border Name="Border" Padding="20,12" Margin="0,0,5,0" CornerRadius="8,8,0,0" Background="{TemplateBinding Background}">
                            <ContentPresenter x:Name="ContentSite" VerticalAlignment="Center" HorizontalAlignment="Center" ContentSource="Header"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="#1C1C21"/>
                                <Setter Property="Foreground" Value="#00E5FF"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="TextBlock" x:Key="CardTitle">
            <Setter Property="FontSize" Value="16"/>
            <Setter Property="FontWeight" Value="Black"/>
            <Setter Property="Margin" Value="0,0,0,15"/>
        </Style>

        <Style TargetType="CheckBox" x:Key="ToggleSwitch">
            <Setter Property="Foreground" Value="#DDDDDD"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="Margin" Value="0,6"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <StackPanel Orientation="Horizontal" Cursor="Hand">
                            <Border x:Name="Border" Width="36" Height="20" CornerRadius="10" Background="#33333C" VerticalAlignment="Center">
                                <Ellipse x:Name="Knob" Width="14" Height="14" Fill="White" HorizontalAlignment="Left" Margin="3,0,0,0">
                                    <Ellipse.RenderTransform><TranslateTransform X="0"/></Ellipse.RenderTransform>
                                </Ellipse>
                            </Border>
                            <ContentPresenter Margin="10,0,0,0" VerticalAlignment="Center"/>
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="#32CD32"/>
                                <Setter TargetName="Knob" Property="HorizontalAlignment" Value="Right"/>
                                <Setter TargetName="Knob" Property="Margin" Value="0,0,3,0"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        
        <Style TargetType="CheckBox" x:Key="NormalCheck">
            <Setter Property="Foreground" Value="#CCCCCC"/>
            <Setter Property="Margin" Value="0,4"/>
            <Setter Property="FontSize" Value="13"/>
        </Style>
    </Window.Resources>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="120"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <Border Grid.Row="0" Background="#16161A" BorderBrush="#25252D" BorderThickness="0,0,0,2">
            <Grid Margin="30,0">
                <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
                    <TextBlock Text="ULTRA BOOST V1.0 LITE" Foreground="#00E5FF" FontSize="32" FontWeight="Black" HorizontalAlignment="Center"/>
                    <TextBlock Text="Engenharia de Performance para W11 e W10 criado por hid1ng" Foreground="#AAAAAA" FontSize="14" FontWeight="SemiBold" HorizontalAlignment="Center" Margin="0,5"/>
                    <TextBlock Text="De Gamer para Gamer" Foreground="LimeGreen" FontSize="16" FontWeight="Bold" FontStyle="Italic" HorizontalAlignment="Center"/>
                </StackPanel>
                
                <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Top" Margin="0,20,0,0">
                    <Button Name="btnRestore" Content="CRIAR PONTO DE RESTAURACAO" Width="220" Height="35" Background="#FFB000" Foreground="Black" Margin="0,0,10,0"/>
                    <Button Name="btnDiscordTop" Content="ENTRAR NO DISCORD" Width="180" Height="35" Background="#5865F2"/>
                </StackPanel>
            </Grid>
        </Border>

        <Grid Grid.Row="1">
            <TabControl Background="#0F0F11" BorderThickness="0" Margin="20,15,20,20">
                
                <TabItem Header="TUTORIAL">
                    <Border Background="#1C1C21" CornerRadius="12" Margin="10,20" Padding="40">
                        <StackPanel>
                            <TextBlock Text="BEM-VINDO AO PAINEL DE CONTROLE" Foreground="#00E5FF" FontSize="24" FontWeight="Black" Margin="0,0,0,30"/>
                            <Border Background="#25252D" CornerRadius="8" Padding="20" Margin="0,0,0,15">
                                <StackPanel>
                                    <TextBlock Text="Como usar as chaves de Otimizacao (Toggle Switches):" Foreground="#FFB000" FontSize="16" FontWeight="Bold"/>
                                    <TextBlock Text="Sempre que a chave estiver VERDE, o servico ou tweak estara otimizado. Se voce desligar a chave e clicar no botao 'APLICAR CONFIGURACOES', aquela funcao especifica voltara imediatamente para o PADRAO DE FABRICA da Microsoft." Foreground="#AAAAAA" Margin="0,5,0,0" TextWrapping="Wrap"/>
                                </StackPanel>
                            </Border>
                        </StackPanel>
                    </Border>
                </TabItem>

                <TabItem Header="INSTALADOR">
                    <Grid Margin="0,20,0,0">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="250"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <Border Grid.Column="0" Background="#1C1C21" CornerRadius="12" Margin="0,0,20,0" Padding="20">
                            <StackPanel>
                                <TextBlock Text="GERENCIADOR" Foreground="#AAAAAA" FontWeight="Bold" Margin="0,0,0,15" HorizontalAlignment="Center"/>
                                <Button Name="btnInstall" Content="INSTALAR SELECAO" Height="45" Background="#7B61FF" Margin="0,0,0,10"/>
                                <Button Name="btnClear" Content="LIMPAR TUDO" Height="35" Background="#33333C" Margin="0,0,0,30"/>

                                <TextBlock Text="DEBLOAT (NAVEGADORES)" Foreground="#FF2A5F" FontWeight="Bold" Margin="0,0,0,15" HorizontalAlignment="Center"/>
                                <TextBlock Text="Desative o 2o plano para liberar RAM:" Foreground="#888888" FontSize="11" TextWrapping="Wrap" Margin="0,0,0,10"/>
                                <CheckBox Name="chkDebloatChrome" Content="Google Chrome" Style="{StaticResource ToggleSwitch}"/>
                                <CheckBox Name="chkDebloatEdge" Content="Microsoft Edge" Style="{StaticResource ToggleSwitch}"/>
                                <CheckBox Name="chkDebloatBrave" Content="Brave Browser" Style="{StaticResource ToggleSwitch}"/>
                                <Button Name="btnApplyDebloat" Content="APLICAR DEBLOAT" Height="35" Background="#FF6B00" Margin="0,15,0,0"/>
                            </StackPanel>
                        </Border>

                        <ScrollViewer Grid.Column="1" VerticalScrollBarVisibility="Auto">
                            <WrapPanel Name="InstallWrapPanel" Orientation="Horizontal" ItemWidth="230">
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Navegadores" Style="{StaticResource CardTitle}" Foreground="#00E5FF"/>
                                    <CheckBox Content="Brave Browser" Tag="Brave.Brave" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Google Chrome" Tag="Google.Chrome" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Opera GX" Tag="Opera.OperaGX" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Mozilla Firefox" Tag="Mozilla.Firefox" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Jogos e Launchers" Style="{StaticResource CardTitle}" Foreground="#FF2A5F"/>
                                    <CheckBox Content="Steam" Tag="Valve.Steam" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Epic Games" Tag="EpicGames.EpicGamesLauncher" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Ubisoft Connect" Tag="Ubisoft.Connect" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="EA App" Tag="ElectronicArts.EADesktop" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="GOG Galaxy" Tag="GOG.Galaxy" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Comunicacao" Style="{StaticResource CardTitle}" Foreground="#32CD32"/>
                                    <CheckBox Content="Discord" Tag="Discord.Discord" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Telegram" Tag="Telegram.TelegramDesktop" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Skype" Tag="Microsoft.Skype" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Zoom" Tag="Zoom.Zoom" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Multimidia" Style="{StaticResource CardTitle}" Foreground="#FF2A5F"/>
                                    <CheckBox Content="Spotify" Tag="Spotify.Spotify" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="OBS Studio" Tag="OBSProject.OBSStudio" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="VLC Media Player" Tag="VideoLAN.VLC" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Documentos e Office" Style="{StaticResource CardTitle}" Foreground="#FFB000"/>
                                    <CheckBox Content="Adobe Reader" Tag="Adobe.Acrobat.Reader.64-bit" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="LibreOffice" Tag="TheDocumentFoundation.LibreOffice" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="PDF24 Creator" Tag="PDF24.PDF24Creator" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15"><StackPanel>
                                    <TextBlock Text="Utilitarios" Style="{StaticResource CardTitle}" Foreground="#8A2BE2"/>
                                    <CheckBox Content="PowerToys" Tag="Microsoft.PowerToys" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="7-Zip" Tag="7zip.7zip" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="WinRAR" Tag="RARLab.WinRAR" Style="{StaticResource NormalCheck}"/>
                                    <CheckBox Content="Revo Uninstaller" Tag="RevoUninstaller.RevoUninstaller" Style="{StaticResource NormalCheck}"/>
                                </StackPanel></Border>
                            </WrapPanel>
                        </ScrollViewer>
                    </Grid>
                </TabItem>

                <TabItem Header="WINDOWS TWEAKS">
                    <Grid Margin="0,20,0,0">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="250"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <Border Grid.Column="0" Background="#1C1C21" CornerRadius="12" Margin="0,0,20,0" Padding="20">
                            <StackPanel>
                                <TextBlock Text="CONTROLE" Foreground="#AAAAAA" FontWeight="Bold" Margin="0,0,0,20" HorizontalAlignment="Center"/>
                                <Button Name="btnApplyTweaks" Content="APLICAR CONFIGURACOES" Height="45" Background="#32CD32" Foreground="Black" Margin="0,0,0,15"/>
                                <Button Name="btnResetAllTweaks" Content="RESTAURAR TUDO" Height="35" Background="#33333C" Foreground="White"/>
                            </StackPanel>
                        </Border>

                        <ScrollViewer Grid.Column="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,0,15">
                                    <StackPanel>
                                        <TextBlock Text="Performance Base (Geral e Rede)" Style="{StaticResource CardTitle}" Foreground="#00E5FF"/>
                                        <WrapPanel Orientation="Horizontal">
                                            <StackPanel Width="320" Margin="0,0,20,0">
                                                <CheckBox Name="chkPriority" Content="Max Win32 Priority Separation (FPS Maximo)" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Name="chkFastKill" Content="Fast Task Kill (Fechar apps travados rapido)" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                            <StackPanel Width="320">
                                                <CheckBox Name="chkNetwork" Content="Desativar Limite de Banda (Melhorar Ping)" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Name="chkGameDVR" Content="Desativar Xbox GameDVR e Barra de Jogo" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                        </WrapPanel>
                                    </StackPanel>
                                </Border>

                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,0,15">
                                    <StackPanel>
                                        <TextBlock Text="50+ Servicos do Windows (Desativacao Extrema)" Style="{StaticResource CardTitle}" Foreground="#FF2A5F"/>
                                        <TextBlock Text="Ligue a chave para DESATIVAR o servico. Desligue para voltar ao PADRAO de fabrica." Foreground="#888888" Margin="0,0,0,15"/>
                                        <WrapPanel Name="ServicesPanel" Orientation="Horizontal">
                                            <StackPanel Width="250" Margin="0,0,15,0">
                                                <CheckBox Tag="DiagTrack" Content="Telemetria MS (DiagTrack)" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="Spooler" Content="Spooler de Impressao" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="SysMain" Content="SysMain (Uso 100% HD)" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WSearch" Content="Windows Search" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="MapsBroker" Content="Gerenciador de Mapas" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="Fax" Content="Servico de Fax" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="bthserv" Content="Suporte a Bluetooth" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WerSvc" Content="Relatorio de Erros" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WbioSrvc" Content="Biometria (Windows Hello)" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="XblAuthManager" Content="Xbox Live Auth" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                            <StackPanel Width="250" Margin="0,0,15,0">
                                                <CheckBox Tag="XblGameSave" Content="Xbox Live Game Save" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="XboxNetApiSvc" Content="Xbox Net API" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="PcaSvc" Content="Assist. de Compatibilidade" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WpcSvc" Content="Controle dos Pais" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="TrkWks" Content="Rastreamento de Links" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="DPS" Content="Servico de Diagnostico" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WdiServiceHost" Content="Host de Diagnostico" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WdiSystemHost" Content="Host de Sistema Diag." Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="RetailDemo" Content="Servico de Varejo Demo" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="lfsvc" Content="Servico de Geolocalizacao" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                            <StackPanel Width="250" Margin="0,0,15,0">
                                                <CheckBox Tag="EntAppSvc" Content="Gerenc. App Empresarial" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="DusmSvc" Content="Uso de Dados" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="DoSvc" Content="Otimizacao de Entrega" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="TapiSrv" Content="Telefonia" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WpnService" Content="Notificacoes Push" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="RemoteRegistry" Content="Registro Remoto" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="TermService" Content="Area de Trabalho Remota" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="ALG" Content="Gateway de Camada App" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="CscService" Content="Arquivos Offline" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="SmsRouter" Content="Roteamento SMS" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                            <StackPanel Width="250">
                                                <CheckBox Tag="ChtSvc" Content="Servicos de Bate-papo" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="MessagingService" Content="Servico de Mensagens" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="PhoneSvc" Content="Servico de Telefone" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="SensorDataService" Content="Dados de Sensor" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="SensorService" Content="Servico de Sensor" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="SensrSvc" Content="Monitor de Sensor" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="Wecsvc" Content="Coletor de Eventos" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="WpnUserService" Content="Notificacoes de Usuario" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="OneSyncSvc" Content="Sincronizacao de Host" Style="{StaticResource ToggleSwitch}"/>
                                                <CheckBox Tag="wisvc" Content="Windows Insider Service" Style="{StaticResource ToggleSwitch}"/>
                                            </StackPanel>
                                        </WrapPanel>
                                    </StackPanel>
                                </Border>
                            </StackPanel>
                        </ScrollViewer>
                    </Grid>
                </TabItem>

                <TabItem Header="PERSONALIZACAO">
                    <Grid Margin="0,20,0,0">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="250"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <Border Grid.Column="0" Background="#1C1C21" CornerRadius="12" Margin="0,0,20,0" Padding="20">
                            <StackPanel>
                                <TextBlock Text="CONTROLE VISUAL" Foreground="#AAAAAA" FontWeight="Bold" Margin="0,0,0,20" HorizontalAlignment="Center"/>
                                <Button Name="btnApplyVisuals" Content="APLICAR CONFIGURACOES" Height="45" Background="#8A2BE2" Foreground="White" Margin="0,0,0,15"/>
                                <Button Name="btnResetVisuals" Content="RESTAURAR TUDO" Height="35" Background="#33333C" Foreground="White"/>
                            </StackPanel>
                        </Border>

                        <ScrollViewer Grid.Column="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel>
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,0,15">
                                    <StackPanel>
                                        <TextBlock Text="Interface de Usuario" Style="{StaticResource CardTitle}" Foreground="#00E5FF"/>
                                        <CheckBox Name="chkDarkMode" Content="Forcar Modo Escuro Global (Apps e Sistema)" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkTaskbarLeft" Content="Alinhar Menu Iniciar a Esquerda (Win 11)" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkTransparence" Content="Desativar Transparencia do Windows (Ganho FPS)" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkWidgets" Content="Ocultar Icone de Widgets da Barra" Style="{StaticResource ToggleSwitch}"/>
                                    </StackPanel>
                                </Border>
                            </StackPanel>
                        </ScrollViewer>
                    </Grid>
                </TabItem>

                <TabItem Header="LIMPEZA (CLEANUP)">
                    <Grid Margin="0,20,0,0">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="250"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <Border Grid.Column="0" Background="#1C1C21" CornerRadius="12" Margin="0,0,20,0" Padding="20">
                            <StackPanel>
                                <TextBlock Text="LIMPEZA DO SISTEMA" Foreground="#AAAAAA" FontWeight="Bold" Margin="0,0,0,20" HorizontalAlignment="Center"/>
                                <Button Name="btnApplyCleanup" Content="EXECUTAR LIMPEZAS" Height="45" Background="#FF6B00" Foreground="White" Margin="0,0,0,15"/>
                                <Button Name="btnClearCleanupSelection" Content="DESMARCAR TUDO" Height="35" Background="#33333C" Foreground="White"/>
                                <TextBlock Text="Aviso:" Foreground="#FFB000" FontWeight="Bold" FontSize="11" Margin="0,20,0,5"/>
                                <TextBlock Text="Acoes diretas de limpeza de disco. Nao precisam ser restauradas." Foreground="#888888" FontSize="11" TextWrapping="Wrap"/>
                            </StackPanel>
                        </Border>

                        <ScrollViewer Grid.Column="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel Name="CleanupPanel">
                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,0,15">
                                    <StackPanel>
                                        <TextBlock Text="Arquivos Temporarios e Sistema" Style="{StaticResource CardTitle}" Foreground="#FF2A5F"/>
                                        <CheckBox Name="chkCleanTemp" Content="Limpar Arquivos Temporarios (Temp/Prefetch)" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkEmptyBin" Content="Esvaziar Lixeira do Windows" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkCleanMgr" Content="Abrir Limpeza de Disco Nativa do Windows" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkCleanLogs" Content="Limpar Arquivos de Log (Visualizador de Eventos)" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkShowHiddenDev" Content="Exibir Dispositivos Ocultos (Gerenciador de Disp.)" Style="{StaticResource ToggleSwitch}"/>
                                    </StackPanel>
                                </Border>

                                <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,0,15">
                                    <StackPanel>
                                        <TextBlock Text="Caches de Aplicativos" Style="{StaticResource CardTitle}" Foreground="#00E5FF"/>
                                        <CheckBox Name="chkCleanDiscord" Content="Limpar Cache do Discord" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkCleanSpotify" Content="Limpar Cache do Spotify" Style="{StaticResource ToggleSwitch}"/>
                                        <CheckBox Name="chkCleanDirectX" Content="Limpar Cache do DirectX (D3DSCache)" Style="{StaticResource ToggleSwitch}"/>
                                    </StackPanel>
                                </Border>
                            </StackPanel>
                        </ScrollViewer>
                    </Grid>
                </TabItem>
                
                <TabItem Header="CONFIGURACOES EXTRAS">
                    <Grid Margin="0,20,0,0">
                        <WrapPanel Orientation="Horizontal" ItemWidth="350">
                            <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15">
                                <StackPanel>
                                    <TextBlock Text="Paineis Ocultos Legacy" Style="{StaticResource CardTitle}" Foreground="#8A2BE2"/>
                                    <Button Name="btnControlPanel" Content="Abrir Painel de Controle Antigo" Height="35" Background="#33333C" Margin="0,0,0,10"/>
                                    <Button Name="btnNetworkPanel" Content="Abrir Conexoes de Rede" Height="35" Background="#33333C" Margin="0,0,0,10"/>
                                    <Button Name="btnSoundPanel" Content="Abrir Configuracoes de Som Antigas" Height="35" Background="#33333C"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1C1C21" CornerRadius="12" Padding="20" Margin="0,0,15,15">
                                <StackPanel>
                                    <TextBlock Text="Reparo de Sistema" Style="{StaticResource CardTitle}" Foreground="#FF6B00"/>
                                    <Button Name="btnResetNetwork" Content="Resetar Adaptadores de Rede (DNS e Winsock)" Height="35" Background="#33333C" Margin="0,0,0,10"/>
                                </StackPanel>
                            </Border>
                        </WrapPanel>
                    </Grid>
                </TabItem>

            </TabControl>

            <Border Name="TermsOverlay" Background="#E60A0A0A" Panel.ZIndex="100">
                <Border Background="#16161A" CornerRadius="12" BorderBrush="#FF2A5F" BorderThickness="2" Margin="40" Padding="50" VerticalAlignment="Center" HorizontalAlignment="Center" MaxWidth="800">
                    <StackPanel>
                        <TextBlock Text="⚠️ TERMO DE RESPONSABILIDADE" Foreground="#FF2A5F" FontSize="26" FontWeight="Black" HorizontalAlignment="Center" Margin="0,0,0,20"/>
                        <TextBlock Text="O Ultra Boost executa alteracoes avancadas de nivel de Kernel e desativa servicos nativos do Windows para maximizar o desempenho em jogos." Foreground="#CCCCCC" FontSize="15" TextWrapping="Wrap" Margin="0,0,0,15" TextAlignment="Center"/>
                        <TextBlock Text="O uso inadequado das chaves de otimizacao pode resultar em instabilidade do sistema operacional. A responsabilidade por qualquer dano, perda de dados ou necessidade de formatacao e EXCLUSIVAMENTE SUA." Foreground="#AAAAAA" FontSize="14" FontWeight="SemiBold" TextWrapping="Wrap" Margin="0,0,0,35" TextAlignment="Center"/>
                        
                        <CheckBox Name="chkTerms" Content="Eu li os avisos e assumo todos os riscos sobre o meu hardware e software." Style="{StaticResource ToggleSwitch}" HorizontalAlignment="Center" Margin="0,0,0,30"/>
                        
                        <TextBlock Text="Para liberar o painel, digite exatamente: Eu Concordo" Foreground="#00E5FF" FontSize="14" FontWeight="Bold" HorizontalAlignment="Center" Margin="0,0,0,10"/>
                        
                        <Border Background="#0A0A0A" CornerRadius="6" BorderBrush="#33333C" BorderThickness="2" Width="350" Height="45" Margin="0,0,0,30">
                            <TextBox Name="txtTerms" Background="Transparent" Foreground="White" BorderThickness="0" FontSize="16" FontWeight="Bold" HorizontalContentAlignment="Center" VerticalContentAlignment="Center" CaretBrush="White"/>
                        </Border>

                        <Button Name="btnUnlock" Content="LIBERAR ACESSO AO SISTEMA" Width="350" Height="50" Background="#33333C" Foreground="#777777" IsEnabled="False"/>
                    </StackPanel>
                </Border>
            </Border>

        </Grid>
    </Grid>
</Window>
"@

# ==============================================================================
# LÓGICA DO POWERSHELL COMPLETA
# ==============================================================================
try { $window = [Windows.Markup.XamlReader]::Parse($xaml) } catch { exit }

# Mapeamentos UI
$TermsOverlay = $window.FindName("TermsOverlay")
$chkTerms = $window.FindName("chkTerms")
$txtTerms = $window.FindName("txtTerms")
$btnUnlock = $window.FindName("btnUnlock")
$btnDiscordTop = $window.FindName("btnDiscordTop")
$btnRestore = $window.FindName("btnRestore")

$btnInstall = $window.FindName("btnInstall")
$btnClear = $window.FindName("btnClear")
$InstallWrapPanel = $window.FindName("InstallWrapPanel")
$btnApplyDebloat = $window.FindName("btnApplyDebloat")
$chkDebloatChrome = $window.FindName("chkDebloatChrome")
$chkDebloatEdge = $window.FindName("chkDebloatEdge")
$chkDebloatBrave = $window.FindName("chkDebloatBrave")

$btnApplyTweaks = $window.FindName("btnApplyTweaks")
$btnResetAllTweaks = $window.FindName("btnResetAllTweaks")
$chkPriority = $window.FindName("chkPriority")
$chkFastKill = $window.FindName("chkFastKill")
$chkNetwork = $window.FindName("chkNetwork")
$chkGameDVR = $window.FindName("chkGameDVR")
$ServicesPanel = $window.FindName("ServicesPanel")

$btnApplyVisuals = $window.FindName("btnApplyVisuals")
$btnResetVisuals = $window.FindName("btnResetVisuals")
$chkDarkMode = $window.FindName("chkDarkMode")
$chkTaskbarLeft = $window.FindName("chkTaskbarLeft")
$chkTransparence = $window.FindName("chkTransparence")
$chkWidgets = $window.FindName("chkWidgets")

$btnApplyCleanup = $window.FindName("btnApplyCleanup")
$btnClearCleanupSelection = $window.FindName("btnClearCleanupSelection")
$CleanupPanel = $window.FindName("CleanupPanel")
$chkCleanTemp = $window.FindName("chkCleanTemp")
$chkEmptyBin = $window.FindName("chkEmptyBin")
$chkCleanMgr = $window.FindName("chkCleanMgr")
$chkCleanLogs = $window.FindName("chkCleanLogs")
$chkShowHiddenDev = $window.FindName("chkShowHiddenDev")
$chkCleanDiscord = $window.FindName("chkCleanDiscord")
$chkCleanSpotify = $window.FindName("chkCleanSpotify")
$chkCleanDirectX = $window.FindName("chkCleanDirectX")

$btnControlPanel = $window.FindName("btnControlPanel")
$btnNetworkPanel = $window.FindName("btnNetworkPanel")
$btnSoundPanel = $window.FindName("btnSoundPanel")
$btnResetNetwork = $window.FindName("btnResetNetwork")

# --- LÓGICA DO TERMO DE RESPONSABILIDADE (OVERLAY) ---
$ValidateTerms = {
    if ($chkTerms.IsChecked -and $txtTerms.Text -cne $null -and $txtTerms.Text.Trim() -match "(?i)^Eu Concordo$") {
        $btnUnlock.IsEnabled = $true
        $btnUnlock.Background = "#32CD32"
        $btnUnlock.Foreground = "Black"
    } else {
        $btnUnlock.IsEnabled = $false
        $btnUnlock.Background = "#33333C"
        $btnUnlock.Foreground = "#777777"
    }
}
$chkTerms.Add_Click($ValidateTerms)
$txtTerms.Add_TextChanged($ValidateTerms)
$btnUnlock.Add_Click({ $TermsOverlay.Visibility = "Collapsed" })

# --- LINK DO DISCORD E CABEÇALHO ---
$DiscordLink = "https://discord.gg/f44HUFWbSS"
$btnDiscordTop.Add_Click({ Start-Process $DiscordLink })
$window.Add_Closed({ Start-Process $DiscordLink })

$btnRestore.Add_Click({ 
    Checkpoint-Computer -Description "UltraBoost_Backup" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
    [System.Windows.MessageBox]::Show("Backup criado com sucesso!", "Ultra Boost V1") 
})

# --- INSTALADOR E DEBLOAT ---
$btnClear.Add_Click({
    foreach ($card in $InstallWrapPanel.Children) {
        if ($card.GetType().Name -eq "Border") {
            foreach ($check in $card.Child.Children) { if ($check.GetType().Name -eq "CheckBox") { $check.IsChecked = $false } }
        }
    }
})
$btnInstall.Add_Click({
    $apps = @()
    foreach ($card in $InstallWrapPanel.Children) {
        if ($card.GetType().Name -eq "Border") {
            foreach ($check in $card.Child.Children) { if ($check.GetType().Name -eq "CheckBox" -and $check.IsChecked) { $apps += $check.Tag } }
        }
    }
    if ($apps.Count -gt 0) {
        foreach ($id in $apps) { Start-Process "winget" -ArgumentList "install --id $id --silent --accept-package-agreements" -Wait -WindowStyle Hidden }
        [System.Windows.MessageBox]::Show("Instalacoes concluidas!", "Ultra Boost V1")
    }
})
$btnApplyDebloat.Add_Click({
    if ($chkDebloatChrome.IsChecked) { reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f | Out-Null } else { reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /f | Out-Null }
    if ($chkDebloatEdge.IsChecked) { reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f | Out-Null } else { reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /f | Out-Null }
    if ($chkDebloatBrave.IsChecked) { reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f | Out-Null } else { reg delete "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BackgroundModeEnabled" /f | Out-Null }
    [System.Windows.MessageBox]::Show("Debloat de Navegadores atualizado conforme as chaves.", "Sucesso")
})

# --- WINDOWS TWEAKS COMPLETOS ---
$btnApplyTweaks.Add_Click({
    if ($chkPriority.IsChecked) { reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f | Out-Null } else { reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f | Out-Null }
    if ($chkFastKill.IsChecked) { reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f | Out-Null } else { reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "0" /f | Out-Null }
    if ($chkNetwork.IsChecked) { reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f | Out-Null } else { reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f | Out-Null }
    if ($chkGameDVR.IsChecked) { reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f | Out-Null } else { reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f | Out-Null }

    foreach ($coluna in $ServicesPanel.Children) {
        foreach ($servico in $coluna.Children) {
            if ($servico.IsChecked) {
                Set-Service -Name $servico.Tag -StartupType Disabled -ErrorAction SilentlyContinue
                Stop-Service -Name $servico.Tag -Force -ErrorAction SilentlyContinue
            } else {
                Set-Service -Name $servico.Tag -StartupType Manual -ErrorAction SilentlyContinue
            }
        }
    }
    [System.Windows.MessageBox]::Show("Chaves ligadas = Otimizado. Chaves desligadas = Padrao Microsoft.", "Sucesso")
})

$btnResetAllTweaks.Add_Click({
    $chkPriority.IsChecked = $false; $chkFastKill.IsChecked = $false; $chkNetwork.IsChecked = $false; $chkGameDVR.IsChecked = $false
    foreach ($coluna in $ServicesPanel.Children) { foreach ($servico in $coluna.Children) { $servico.IsChecked = $false } }
})

# --- PERSONALIZACAO ---
$btnApplyVisuals.Add_Click({
    if ($chkDarkMode.IsChecked) { reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f | Out-Null; reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f | Out-Null } else { reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 1 /f | Out-Null; reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 1 /f | Out-Null }
    if ($chkTaskbarLeft.IsChecked) { reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f | Out-Null } else { reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 1 /f | Out-Null }
    if ($chkTransparence.IsChecked) { reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f | Out-Null } else { reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f | Out-Null }
    if ($chkWidgets.IsChecked) { reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f | Out-Null } else { reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 1 /f | Out-Null }
    [System.Windows.MessageBox]::Show("Configuracoes visuais aplicadas.", "Sucesso")
})
$btnResetVisuals.Add_Click({
    $chkDarkMode.IsChecked = $false; $chkTaskbarLeft.IsChecked = $false; $chkTransparence.IsChecked = $false; $chkWidgets.IsChecked = $false
})

# --- LIMPEZA (CLEANUP) SILENCIOSA ---
$btnApplyCleanup.Add_Click({
    if ($chkCleanTemp.IsChecked) {
        Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    if ($chkEmptyBin.IsChecked) { Clear-RecycleBin -Force -ErrorAction SilentlyContinue }
    if ($chkCleanDiscord.IsChecked) { Remove-Item -Path "$env:APPDATA\discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($chkCleanSpotify.IsChecked) { Remove-Item -Path "$env:LOCALAPPDATA\Spotify\Storage\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($chkCleanDirectX.IsChecked) { Remove-Item -Path "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue }
    
    if ($chkCleanLogs.IsChecked) { wevtutil el | Foreach-Object { wevtutil cl "$_" 2>$null } }
    
    if ($chkShowHiddenDev.IsChecked) {
        setx devmgr_show_nonpresent_devices 1 -m | Out-Null
        Start-Process "devmgmt.msc"
    }
    if ($chkCleanMgr.IsChecked) { Start-Process "cleanmgr.exe" }

    [System.Windows.MessageBox]::Show("Procedimentos de Limpeza concluidos com sucesso!", "Ultra Boost V1")
})

$btnClearCleanupSelection.Add_Click({
    foreach ($card in $CleanupPanel.Children) {
        if ($card.GetType().Name -eq "Border") {
            foreach ($check in $card.Child.Children) { if ($check.GetType().Name -eq "CheckBox") { $check.IsChecked = $false } }
        }
    }
})

# --- CONFIGURAÇÕES EXTRAS ---
$btnControlPanel.Add_Click({ Start-Process "control" })
$btnNetworkPanel.Add_Click({ Start-Process "ncpa.cpl" })
$btnSoundPanel.Add_Click({ Start-Process "mmsys.cpl" })
$btnResetNetwork.Add_Click({ Start-Process "cmd.exe" -ArgumentList "/c ipconfig /flushdns & netsh winsock reset" -WindowStyle Hidden; [System.Windows.MessageBox]::Show("DNS e Rede resetados.", "Concluido") })

$window.ShowDialog() | Out-Null
