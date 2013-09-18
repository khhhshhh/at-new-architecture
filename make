if [ "$1" = "start" ] || [ "$1" = "" ]
then
    echo [x] Building assets and starting development server...
    mimosa watch -s
elif [ "$1" = "startd" ]
then
    echo [x] Cleaning compiled directory, building assets and starting development server..
    mimosa watch -sd
elif [ "$1" = "build" ]
then	
    echo [x] Building assets...
    mimosa build
elif [ "$1" = "test" ]
then	
    echo [x] Using Jasmine and Krama to test... 
    karma start
elif [ "$1" = "build-opt" ] || [ "$1" == "buildo" ]
then	
    echo [x] Building and optimizing assets...
    mimosa build -o
elif [ "$1" = "clean" ]
then	
    echo [x] Removing compiled files...
    mimosa clean
elif [ "$1" = "pack" ]
then	
    echo [x] Building and packaging application...
    mimosa build -omp
elif [ "$1" = "package" ]
then	
    echo [x] Building and packaging application...
    mimosa build -omp
elif [ "$1" = "dist" ] || [ "$1" = "distribute" ]
then	
    echo [x] Building and distributing application...
    mimosa clean --force
    mimosa build -om
    rm -rf dist
    cp -a public dist/
    cp views/index-optimize.html dist/index.html
elif [ "$1" = "widget" ]
then	
    node make-widget.js $2
fi
