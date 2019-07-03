/*
 * Copyright 2018 Google LLC.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package example;

import com.google.common.io.CharStreams;

import java.io.InputStreamReader;
import java.io.IOException;
import java.io.Reader;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;

public class HelloJarWorld {

  public static void main(String[] args) throws URISyntaxException, IOException {
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    try (Reader reader = new InputStreamReader(
        HelloJarWorld.class.getResourceAsStream("/world"), StandardCharsets.UTF_8)) {
      String world = CharStreams.toString(reader);
      System.out.println("Hello " + world + "!");
    }

    Package pack = HelloJarWorld.class.getPackage();
    System.out.println("Specification-Title: " + pack.getSpecificationTitle());
    System.out.println("Specification-Version: " + pack.getSpecificationVersion());
    System.out.println("Specification-Vendor: " + pack.getSpecificationVendor());
    System.out.println("Implementation-Title: " + pack.getImplementationTitle());
    System.out.println("Implementation-Version: " + pack.getImplementationVersion());
    System.out.println("Implementation-Vendor: " + pack.getImplementationVendor());
  }
}
