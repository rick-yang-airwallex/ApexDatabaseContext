/**
 * BSD 3-Clause License
 *
 * Copyright (c) 2020, https://github.com/apexfarm/ApexDatabaseContext
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

public with sharing class DMLResult {
    List<Database.Error> errors;
    Id id;
    Boolean isSuccess;
    Boolean isCreated;

    public Id getId() {
        return id;
    }

    public Boolean isSuccess() {
        return isSuccess;
    }

    public Boolean isCreated() {
        return isCreated;
    }

    public List<Database.Error> getErrors() {
        return errors;
    }

    public DMLResult(Id id, Boolean isSuccess, Boolean isCreated) {
        this.id = id;
        this.isSuccess = isSuccess;
        this.isCreated = isCreated;
        this.errors = new List<Database.Error>();
    }

    public DMLResult(Database.SaveResult result, Boolean isCreated) {
        this.errors = result.getErrors();
        this.id = result.getId();
        this.isSuccess = result.isSuccess();
        this.isCreated = isCreated;
    }

    public DMLResult(Database.UpsertResult result) {
        this.errors = result.getErrors();
        this.id = result.getId();
        this.isSuccess = result.isSuccess();
        this.isCreated = result.isCreated();
    }

    public DMLResult(Database.DeleteResult result) {
        this.errors = result.getErrors();
        this.id = result.getId();
        this.isSuccess = result.isSuccess();
        this.isCreated = false;
    }

    public DMLResult(Database.UndeleteResult result) {
        this.errors = result.getErrors();
        this.id = result.getId();
        this.isSuccess = result.isSuccess();
        this.isCreated = false;
    }

    public DMLResult(Database.EmptyRecycleBinResult result) {
        this.errors = result.getErrors();
        this.id = result.getId();
        this.isSuccess = result.isSuccess();
        this.isCreated = false;
    }
}