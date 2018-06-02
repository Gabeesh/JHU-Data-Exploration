
> install.packages("data.table")
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/data.table_1.11.4.zip'
Content type 'application/zip' length 1829000 bytes (1.7 MB)
downloaded 1.7 MB

package ‘data.table’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Temp\RtmpiEc8I1\downloaded_packages
> getwd()
[1] "C:/Users/a39285/Google Drive/Computer/Documents"
> setwd("C:/R/4_Exploratory_DATA")
> getwd()
[1] "C:/R/4_Exploratory_DATA"
> #Reads in data from file then subsets data for specified dates
> powerDT <- data.table::fread(input = "household_power_consumption.txt"
+                              , na.strings="?"
+ )
> powerDT
               Date     Time Global_active_power Global_reactive_power Voltage Global_intensity
      1: 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4
      2: 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0
      3: 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0
      4: 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0
      5: 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8
     ---                                                                                       
2075255: 26/11/2010 20:58:00               0.946                 0.000  240.43              4.0
2075256: 26/11/2010 20:59:00               0.944                 0.000  240.00              4.0
2075257: 26/11/2010 21:00:00               0.938                 0.000  239.82              3.8
2075258: 26/11/2010 21:01:00               0.934                 0.000  239.70              3.8
2075259: 26/11/2010 21:02:00               0.932                 0.000  239.55              3.8
         Sub_metering_1 Sub_metering_2 Sub_metering_3
      1:              0              1             17
      2:              0              1             16
      3:              0              2             17
      4:              0              1             17
      5:              0              1             17
     ---                                             
2075255:              0              0              0
2075256:              0              0              0
2075257:              0              0              0
2075258:              0              0              0
2075259:              0              0              0
> # Prevents histogram from printing in scientific notation
> powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
> # Change Date Column to Date Type
> powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
> # Filter Dates for 2007-02-01 and 2007-02-02
> powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
> png("plot1.png", width=480, height=480)
> ## Plot 1
> hist(powerDT[, Global_active_power], main="Global Active Power", 
+      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
> dev.off()
null device 
          1 