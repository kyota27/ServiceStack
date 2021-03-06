REM SET SERVICESTACK_DEPLOY_PATH=..\release\latest
REM SET BUILD=Debug
SET BUILD=Release

COPY ..\release\lib\ServiceStack.Interfaces.dll ..\lib
COPY ..\release\lib\ServiceStack.OrmLite.dll ..\lib
COPY ..\release\lib\ServiceStack.Text.dll ..\lib

COPY ..\release\lib\ServiceStack.OrmLite.dll ..\lib\tests
COPY ..\release\lib\ServiceStack.OrmLite.Sqlite.dll ..\lib\tests
COPY ..\release\lib\ServiceStack.Redis.dll ..\lib\tests


SET PROJ_LIBS=
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.Common\bin\%BUILD%\ServiceStack.Common.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.ServiceModel\bin\%BUILD%\ServiceStack.ServiceModel.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.Configuration\bin\%BUILD%\ServiceStack.Configuration.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.Validation\bin\%BUILD%\ServiceStack.Validation.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.Messaging\bin\%BUILD%\ServiceStack.Messaging.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.WebHost.Endpoints\bin\%BUILD%\ServiceStack.WebHost.Endpoints.dll

SET PROJ_LIBS=%PROJ_LIBS% ..\src\Funq\bin\%BUILD%\Funq.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.ServiceHost\bin\%BUILD%\ServiceStack.ServiceHost.dll

SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.ServiceClient.Web\bin\%BUILD%\ServiceStack.ServiceClient.Web.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.CacheAccess.Providers\bin\%BUILD%\ServiceStack.CacheAccess.Providers.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\src\ServiceStack.Compression\bin\%BUILD%\ServiceStack.Compression.dll

REM External ServiceStack components
SET PROJ_LIBS=%PROJ_LIBS% ..\release\lib\ServiceStack.OrmLite.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\release\lib\ServiceStack.OrmLite.Sqlite.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\release\lib\ServiceStack.OrmLite.SqlServer.dll

SET PROJ_LIBS=%PROJ_LIBS% ..\release\lib\ServiceStack.Redis.dll
SET PROJ_LIBS=%PROJ_LIBS% ..\release\lib\ServiceStack.Text.dll

ILMERGE.exe /ndebug /t:library /out:ServiceStack.dll %PROJ_LIBS%

REM Deploy the memcached server as well
COPY ..\ServiceStack.CacheAccess.Memcached\bin\%BUILD%\ServiceStack.CacheAccess.Memcached.dll .
COPY ..\src\ServiceStack.ServiceInterface\bin\%BUILD%\ServiceStack.ServiceInterface.* .

REM COPY *.dll ..\lib\tests
COPY *.dll ..\release\latest
COPY *.pdb ..\release\latest
COPY *.dll ..\lib

REM COPY *.dll %SERVICESTACK_DEPLOY_PATH%

COPY ..\src\ServiceStack.Common\bin\%BUILD%\ServiceStack.Common.dll ..\release\lib\
COPY ..\src\ServiceStack.Messaging\bin\%BUILD%\ServiceStack.Messaging.dll ..\release\lib\

COPY ServiceStack.dll ..\..\ServiceStack.Examples\Lib
COPY ..\release\lib\ServiceStack.Interfaces.dll ..\..\ServiceStack.Examples\Lib
COPY ..\release\latest\ServiceStack.ServiceInterface.dll ..\..\ServiceStack.Examples\Lib

COPY ServiceStack.dll ..\..\MonoTouch.Examples\src\Server\Lib
COPY ..\release\lib\ServiceStack.Interfaces.dll ..\..\MonoTouch.Examples\src\Server\Lib

COPY ServiceStack.dll ..\..\ServiceStack.RedisWebServices\Lib
COPY ..\release\lib\ServiceStack.Interfaces.dll ..\..\ServiceStack.RedisWebServices\Lib
COPY ..\release\latest\ServiceStack.ServiceInterface.dll ..\..\ServiceStack.RedisWebServices\Lib

COPY ..\release\lib\ServiceStack.Interfaces.dll ..\..\ServiceStack.Redis\Lib
COPY ..\release\lib\ServiceStack.Common.dll ..\..\ServiceStack.Redis\Lib
COPY ..\release\lib\ServiceStack.Messaging.dll ..\..\ServiceStack.Redis\Lib
COPY ..\release\lib\ServiceStack.Text.dll ..\..\ServiceStack.Redis\Lib


