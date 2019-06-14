@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  examples startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0\\build\\distributions\\examples-1.0\\examples-1.0\\
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

rem echo %APP_HOME%
@rem Add default JVM options here. You can also use JAVA_OPTS and EXAMPLES_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
set ARG1=%1

:execute
@rem Setup the command line

pushd %APP_HOME%
rem set CLASSPATH=%APP_HOME%\lib\examples-1.0.jar;%APP_HOME%\lib\common-1.0.jar;%APP_HOME%\lib\hsqldb-2.3.4.jar;%APP_HOME%\lib\hashids-1.0.3.jar;%APP_HOME%\lib\undertow-core-2.0.13.Final.jar;%APP_HOME%\lib\metrics-logback-4.0.3.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\metrics-jvm-4.0.3.jar;%APP_HOME%\lib\metrics-json-4.0.3.jar;%APP_HOME%\lib\metrics-graphite-4.0.3.jar;%APP_HOME%\lib\metrics-core-4.0.3.jar;%APP_HOME%\lib\metrics-healthchecks-4.0.3.jar;%APP_HOME%\lib\HikariCP-3.2.0.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\guava-26.0-jre.jar;%APP_HOME%\lib\jool-0.9.12.jar;%APP_HOME%\lib\config-1.3.3.jar;%APP_HOME%\lib\okhttp-urlconnection-3.11.0.jar;%APP_HOME%\lib\logging-interceptor-3.11.0.jar;%APP_HOME%\lib\okhttp-3.11.0.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.11.419.jar;%APP_HOME%\lib\failsafe-1.1.0.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.9.7.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.9.7.jar;%APP_HOME%\lib\jackson-dataformat-csv-2.9.7.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.11.419.jar;%APP_HOME%\lib\aws-java-sdk-core-1.11.419.jar;%APP_HOME%\lib\jmespath-java-1.11.419.jar;%APP_HOME%\lib\jackson-databind-2.9.7.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.6.7.jar;%APP_HOME%\lib\jackson-core-2.9.7.jar;%APP_HOME%\lib\jackson-annotations-2.9.7.jar;%APP_HOME%\lib\jboss-logging-3.3.2.Final.jar;%APP_HOME%\lib\xnio-nio-3.3.8.Final.jar;%APP_HOME%\lib\xnio-api-3.3.8.Final.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.5.2.jar;%APP_HOME%\lib\error_prone_annotations-2.1.3.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\amqp-client-4.4.1.jar;%APP_HOME%\lib\okio-1.14.0.jar;%APP_HOME%\lib\httpclient-4.5.5.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\joda-time-2.8.1.jar;%APP_HOME%\lib\httpcore-4.4.9.jar;%APP_HOME%\lib\commons-codec-1.10.jar
set CLASSPATH=
set JARS=
for %%i in (lib\*.jar) do call c:\s\scripts\cpappend.bat %%i
rem echo %JARS%
set CLASSPATH=%JARS%

@rem Execute examples
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.Main %CMD_LINE_ARGS%
if "%ARG1%" == "1" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.hikaricp.ConnectionPools
)
if "%ARG1%" == "2" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.undertow.helloworld.HelloWorldServer
)
if "%ARG1%" == "3" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.undertow.routing.RoutingServer
)
if "%ARG1%" == "4" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.undertow.accesslog.AccessLogServer
)
if "%ARG1%" == "5" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.undertow.contenttypes.ContentTypesServer
)
if "%ARG1%" == "6" (
	"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %EXAMPLES_OPTS%  -classpath "%CLASSPATH%" ex.examples.TypesafeConfigExamples
)
popd

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable EXAMPLES_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%EXAMPLES_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
