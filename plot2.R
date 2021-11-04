# Subo archivo 

data <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Coloco los nombres a las columnas

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# verifico la estructura del archivo

head(data)

# creo el subcinjunto de datos

subconjunto <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

head(subconjunto)

# trandformacion de datos

subconjunto$Date <- as.Date(subconjunto$Date, format="%d/%m/%Y")
subconjunto$Time <- strptime(subconjunto$Time, format="%H:%M:%S")
subconjunto[1:1440,"Time"] <- format(subconjunto[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subconjunto[1441:2880,"Time"] <- format(subconjunto[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# creo funcion

plot(subconjunto$Time,as.numeric(as.character(subconjunto$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Creo el archivo PNG

dev.copy(png, file = "plot2.png",width=480, height=480) 
dev.off() 


