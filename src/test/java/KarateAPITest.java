import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;

public class KarateAPITest {
    @Before
    public void setUp() throws Exception {
        String filepath = System.getProperty("user.dir")+"/target";
        File file=new File(filepath);
        if(file.exists() && file.isDirectory()){
            String[] list = file.list();
            for (String name:list){
                if(name.length()>=15 && name.substring(0,15).contains("karate-reports_")){
                    File reportFile = new File(file+ "/" +name);
                    deleteFile(reportFile);
                }
            }
        }
    }

    private void deleteFile(File directory) {
        if(!directory.isDirectory()){
            directory.delete();
        }
        else{
            File [] files = directory.listFiles();

            // empty directory
            if(files.length == 0){
                directory.delete();
                System.out.println("Delete" + directory.getAbsolutePath());
                return;
            }

            // delete sub-directory and sub-files
            for(File file : files){
                if(file.isDirectory()){
                    deleteFile(file);
                }
                else {
                    file.delete();
                    System.out.println("Delete" + file.getAbsolutePath());
                }

            }

            // delete directory
            directory.delete();
            System.out.println("Delete" + directory.getAbsolutePath());

        }
    }
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:karate")
                .outputCucumberJson(true)
                .tags("@AdQueryService")
                .parallel(8);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "KarateAPITest");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


}
