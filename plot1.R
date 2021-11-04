# Subo archivo 

data <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Coloco los nombres a las columnas

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# verifico la estructura del archivo

head(data)

# creo el subcinjunto de datos

subconjunto <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

head(subconjunto)

# Creo la función Hist

hist(as.numeric(as.character(subconjunto$Global_active_power)),col="red",main="Global Active Power",xlab="Global active power(kilowatts)")

# Creo el archivo PNG

dev.copy(png, file = "plot1.png",width=480, height=480) 
dev.off() 


