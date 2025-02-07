import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class SSRSReportGenerator {

    private static final String SSRS_REPORT_URL = "http://your-ssrs-server/ReportServer/Pages/ReportViewer.aspx?/YourReportPath/YourReportName";
    private static final String OUTPUT_PDF_FILE = "output_report.pdf";

    public static void main(String[] args) {
        try {
            // Pobranie raportu ze zdalnego serwera SSRS
            byte[] reportBytes = downloadReport(SSRS_REPORT_URL);

            // Wygenerowanie raportu w formacie PDF
            generatePdfReport(reportBytes, OUTPUT_PDF_FILE);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static byte[] downloadReport(String reportUrl) throws IOException {
        HttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(reportUrl);
        HttpResponse response = httpClient.execute(httpGet);

        try (InputStream inputStream = response.getEntity().getContent()) {
            return inputStream.readAllBytes();
        }
    }

    private static void generatePdfReport(byte[] reportBytes, String outputFilePath) throws JRException, IOException {
        // Załadowanie raportu JasperReports z bajtów
        JasperReport jasperReport = JasperCompileManager.compileReport(reportBytes);

        // Utworzenie pustego raportu
        JasperPrint jasperPrint = new JasperPrint();

        // Wypełnienie raportu danymi (możesz przekazać dane raportu, jeśli są wymagane)
        JasperFillManager.getInstance().fillReport(jasperReport, null, new JREmptyDataSource(), jasperPrint);

        // Ustawienie konfiguracji eksportu PDF
        SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
        configuration.setCreatingBatchModeBookmarks(true);

        // Eksport do pliku PDF
        try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
            JRPdfExporter exporter = new JRPdfExporter();
            exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
            exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputStream));
            exporter.setConfiguration(configuration);
            exporter.exportReport();
        }
    }
}
